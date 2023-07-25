open Types_j
open Types_t
open Bool

let default_path = "/home/camel/Desktop/OcamlProjections/"
let default_json = "auto.json"

(** constant to represent empty transitions *)
let epsilon = '~'  

(** type of fumction a participant has in a projection *)
type type_p_func = SENDER | RECEIVER

(** type of fumction a participant has in a projection *)
type type_internal = BELONG | NBELONG

(** checks if the association.role equals the role *)
let is_association_of_role (role : string) (assoc : association) =
  String.equal assoc.role role  
;;

(** checks if two strings are equal *)
let is_string_equal (s1 : string) (s2 : string) : bool =
  String.equal s1 s2
;;

(** print a transition list *)
let rec print_transition_list ls = 
  match ls with
    [] -> ()
    | x :: xs -> Printf.printf "%s\n" (x |> string_of_transition_proj); print_transition_list xs
;;

(** print a association list *)
let rec print_association_list ls = 
  match ls with
    [] -> ()
    | x :: xs -> Printf.printf "%s\n" (x |> string_of_association); print_association_list xs
;;

(** builds and returns the action label of a transition *)
let get_action_label (proj : transition_proj) p_ftype is_starter = 
    match (p_ftype,is_starter) with
    (SENDER, true) -> 
      { proj with action = "getContract()" }
    | (SENDER, false) -> 
      { proj with action = String.cat "!" proj.action }
    | (RECEIVER, true) -> 
      { proj with action = "findContract()" }
    | (RECEIVER, false) -> 
      { proj with action = String.cat "?" proj.action }
;;

(** makes a transitions for the projection *)
let make_transtion_proj (t : transition_global) p_ftype : transition_proj = 
  let proj : transition_proj = { fromS = t.fromS; toS = t.toS; action = t.action; inputP = t.input; preC = t.preC; postC = t.postC; } in
  match t.fromS with
    "_" -> 
      get_action_label proj p_ftype true
    | _ ->
      get_action_label proj p_ftype false      
;;

(** Checks if a participant is in the association between role and participants.
  @author JAfonso  
  @param part - participant
  @param a - association between role and participants
*)
let is_part_in_association part (a : association) =
  List.exists (is_string_equal part) a.parts
;;

(** Checks if a participant it can call the transition. 
  It does this by checking if it is present in either the new parts or existent ones.
  @author JAfonso  
  @param t - transition
  @param part - participant
*)
let is_participant_in_transition (t : transition_global) part = 
  (||) (List.mem part t.exi_p.parts) (List.exists (is_part_in_association part) t.new_p)
;;

(** Treats a transition from a global type to a transition of a projection.
  @author JAfonso  
  @param t - transition global type
  @param part - participants of a specific type
*)
let get_transitions_proj (part : string list) (t : transition_global) =
  match (List.exists (is_participant_in_transition t) part) with
    true -> 
      make_transtion_proj t SENDER
    | false -> 
      make_transtion_proj t RECEIVER
;;

(** Treats an internal transition from a global type to a transition of a projection.
  @author JAfonso  
  @param t - transition global type
  @param part - participants of a specific type
*)
let get_internal_transitions_proj (part : string list) (t : transition_global) =
  match (List.exists (is_participant_in_transition t) part) with
    true -> 
      (BELONG, (make_transtion_proj t SENDER))
    | false -> 
      (NBELONG, (make_transtion_proj t RECEIVER))
;;

let transitionGet3 trns = List.map ( fun (_,c) -> c ) trns

let filter_disjoint_elements_from_list l ls =
  List.filter (fun x -> not (List.mem x l)) ls 
;;

let get_transitions_from_v2 (ops : transition_proj list) (toState : string) =
  List.filter (fun (x : transition_proj) -> String.equal x.fromS toState) ops
;;

let epsilon_closure (transitions_p : transition_proj list) (finalS : string list) (transition_i : transition_proj) = 

  let new_transitions_to = get_transitions_from_v2 transitions_p transition_i.toS in 
  let is_state_end_state = List.exists (fun (x : string) -> String.equal x transition_i.toS) finalS in
  let duplicated_transitions = List.map (fun (x : transition_proj) -> {x with fromS = transition_i.fromS}) new_transitions_to in

  match is_state_end_state with 
    true -> (duplicated_transitions, [transition_i.fromS])
    |false -> (duplicated_transitions, [])
;;

(** Returns reachable a string of reachable states from s*)
let reachable (s : string) (transitions: (string * string) list) =
			
  let neighbourSts st t = transitionGet3 (List.filter (fun (a,_) -> a = st) t) in
  let nextStates (sts: string list) (t: (string * string) list) = List.concat (List.map (fun st -> neighbourSts st t) sts) in
  let remain (s: string list) (t: (string * string) list) = List.filter (fun (a,_) -> not (List.mem a s)) t in
  
  let rec reach visited s t =
    if visited = s then [] 
    else s @ ( reach s (nextStates s t) (remain s t) ) in
  
  reach [] (List.sort_uniq String.compare [s]) transitions
;;

(** Indicates if a list is empty or not.
  @author JAfonso   
*)
let is_list_empty (l : string list) : bool =
match l with  
  [] -> true
  | _ -> false

(** Restrives all normal transitions from the global type provided.
  @author JAfonso
  @param global - global type
*)
let get_normal_transitions_from_global (global : global) =
  List.filter (fun (x : transition_global) -> not x.internal ) global.transitions
;;

(** Restrives all internal transitions from the global type provided.
  @author JAfonso
  @param global - global type
*)
let get_internal_transitions_from_global (global : global) =
  List.filter (fun (x : transition_global) -> x.internal ) global.transitions
;;

(** Filters internal transitions by analysing the first element of a tuple, 
  that states if the internal transition belongs to the current role,
  and also a flag that indicates if we want the states that belong or otherwise.
  Uses XNOR / XAND to make the comparision. 
  @author JAfonso
  @param flag - possession flag
  @param x - possession of transition
*)
let filter_internal_transition flag (x, _) =
  match x with 
    BELONG -> not (true <> flag)
    | NBELONG -> not (false <> flag)
;;

(** Generates a projection of the type role from the global type.
  @author JAfonso
  @param global - global type
  @param role - role of the projection
*)
let proj_by_role (global : global) output_file stats_flag role =  
  (* gets all participants of type <role> *)
  let proj_participants = (List.find (is_association_of_role role) global.role_part).parts in
  
  (* gets transitions of the projection of the type <role>, only treats normal transitions *)
  let transitions = List.map (get_transitions_proj proj_participants) (get_normal_transitions_from_global global) in
  
  (* gets internal transitions in a tuple to identify if they belong to a participant of type <role> *)
  let internal_transitions = List.map (get_internal_transitions_proj proj_participants) (get_internal_transitions_from_global global) in
  
  (* gets internal transitions that belong to participants of type <role> *)
  let int_belong = List.map (fun (_,y) -> y ) (List.filter (filter_internal_transition true) internal_transitions) in

  (* gets internal transitions that do not belong to participants of type <role> *)
  let int_nbelong = List.map (fun (_,y) -> y ) (List.filter (filter_internal_transition false) internal_transitions) in
  
  (* treats internal operations that do not belong to the projection of the type <role> *)
  let l_ops_int_not_belong = (List.map (epsilon_closure transitions global.endS) int_nbelong) in
  
  (* new transitions, generated from the internal transitions that do not belong in this projection*)
  let new_end_states = List.concat (List.map (fun (_,z) -> z ) (List.filter (fun (_,y) -> not (is_list_empty y)) l_ops_int_not_belong)) in

  (* clean up when internal operations do not belong to the role type *)
  let new_internal_transitions = List.concat (List.map (fun (z,_) -> z ) l_ops_int_not_belong) in

   (* removing loops
  let l_ops_proj_filtered =
    List.filter (fun (x : transition_proj) -> Bool.(&&) (String.equal x.toS x.fromS) (String.equal "?" (String.sub x.action 0 1)))  transitions in
    *)

  (* gets edges of transitions *)
   let init_to_end_ops = List.map (fun (x: transition_proj) -> (x.fromS, x.toS)) (List.append (List.append transitions int_belong) new_internal_transitions) in
  
  (* gets reachable states *)
  let reachable_states = reachable global.initialS init_to_end_ops in

  (* remove duplicates *)
  let cons_uniq xs x = if List.mem x xs then xs else x :: xs in
  let remove_from_left xs = List.rev (List.fold_left cons_uniq [] xs) in

  (* removes useless states from all states in the automaton *)
  let r_states = remove_from_left reachable_states in
  let useless_states = filter_disjoint_elements_from_list r_states global.states in
  (* filter_disjoint_elements_from_list r_states *)
  let result_endS = (List.append global.endS new_end_states) in

  let result_ops = List.filter 
    (fun (x : transition_proj) -> 
      Bool.(&&) (not (List.mem x.fromS useless_states)) (not (List.mem x.toS useless_states)) ) 
        (List.append (List.append transitions int_belong) new_internal_transitions) in

  let proj : proj = 
  {
    id = global.id;
    role = role;
    parts = proj_participants;
    initialS = global.initialS;
    states = r_states;
    endS = result_endS;
    transitions = remove_from_left result_ops;
  } in

  Printf.printf "%s\n" (String.cat "" (String.cat role ".json"));

  if stats_flag then
    let string_file = string_of_proj proj in 
    Printf.printf "Projection of role %s\n" role;
    Printf.printf "%s\n" (Yojson.Safe.prettify string_file);  

  let oc = open_out (String.cat output_file (String.cat role ".json")) in
  Printf.fprintf oc "%s\n" (Yojson.Safe.prettify string_file);

;;

(** Reads from json file <path> and then generates the respective projections 
  for each role
  @author JAfonso
  @param path - json input file path
  @param stats_flag - flag to indicate if it shows stats of generated projections
 *)
let main_function input_path output_path stats_flag =  
  let global_t = Atdgen_runtime.Util.Json.from_file read_global input_path in
  List.iter (proj_by_role global_t output_path stats_flag) global_t.roles;
;;

let usage_msg = "-i <inputFile> -o <outputFile>"

let output_file = ref "_proj.json"

let input_file = ref ""

let anon_fun filename =
  input_file := filename

  let speclist =
  [("-o", Arg.Set_string output_file, "Set output file name.")]

(** Main function *)
let () =
  Arg.parse speclist anon_fun usage_msg;
  main_function !input_file !output_file true