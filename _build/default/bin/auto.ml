let default_path = "/home/camel/Desktop/OcamlProjections/"
let default_json = "auto.json"

let epsilon = '~'  (* used for representing the empty transitions *)

let is_association_of_role (role : string) (assoc : Auto_j.association) =
  String.equal assoc.role role  
;;

let list_contains_string (part_of_label : string) (part_of_list : string) : bool =
  String.equal part_of_label part_of_list
;;

let get_label_of_operation (op_l : string) (len : int) (l_type : string) =
  match String.get op_l 0 with 
    '.' -> String.cat l_type (String.sub op_l 1 (len - 1));
    | _ -> op_l
;;

let init_op_proj (op_global : Auto_t.operation_global) (label_type : string) : Auto_t.operation_proj = 
  let l_op_label = op_global.op_label in  
  let l_op_label_length = (String.length l_op_label) in
  let l_op_label =  get_label_of_operation l_op_label l_op_label_length label_type in
  
  {
    fromS     = op_global.fromS;
    toS       = op_global.toS;
    op_label  = l_op_label;
  }
;;

let get_ops_proj (parts : string list) (op_global : Auto_t.operation_global) : Auto_t.operation_proj =
  match List.exists (list_contains_string op_global.part) parts  with
    true -> 
      init_op_proj op_global "!"
    | false ->
      init_op_proj op_global "?"
;;

let transitionGet3 trns = List.map ( fun (_,c) -> c ) trns


let get_transitions_from_v2 (ops : Auto_t.operation_proj list) (toState : string) =
  List.filter (fun (x:Auto_t.operation_proj) -> String.equal x.fromS toState) ops
;;

let epsilon_closure (ops : Auto_t.operation_proj list) (endStates : string list) (op_int_global : Auto_t.operation_global) = 
  let new_transitions_to = get_transitions_from_v2 ops op_int_global.toS in 
    
  let is_state_end_state = List.exists (fun (x:string) -> String.equal x op_int_global.toS) endStates in

  let duplicated_transitions = List.map (fun (x:Auto_t.operation_proj) -> {x with fromS = op_int_global.fromS}) new_transitions_to in

  match is_state_end_state with 
    true -> (duplicated_transitions, [op_int_global.fromS])
    |false -> (duplicated_transitions, [])
;;


let reachable (s : string) (transitions: (string * string) list) =
			
  let neighbourSts st t = transitionGet3 (List.filter (fun (a,_) -> a = st) t) in
  let nextStates (sts: string list) (t: (string * string) list) = List.concat (List.map (fun st -> neighbourSts st t) sts) in
  let remain (s: string list) (t: (string * string) list) = List.filter (fun (a,_) -> not (List.mem a s)) t in
  
  let rec reach visited s t =
    if visited = s then [] 
    else s @ ( reach s (nextStates s t) (remain s t) ) in
  
  reach [] (List.sort_uniq compare [s]) transitions


let get_ops_int_proj (parts : string list) (op_int_global : Auto_t.operation_global) =
  match List.exists (list_contains_string op_int_global.part) parts  with
    true -> 
      (op_int_global, true)
    | false ->
      (op_int_global, false)
;;

let is_not_empty (l : string list) : bool =
match l with  
  [] -> false
  | _ -> true

let proj_by_role (global : Auto_j.global) (role : string) =
  Printf.printf "Projection of role %s\n" role;

  (* gets participants of type <role> *)
  let l_part = (List.find (is_association_of_role role) global.role_part).parts in
  
  (* gets external operations of the projection of the type <role> *)
  let l_ops_proj = List.map (get_ops_proj l_part) global.ops in

  (* labels internal operations if they are called from a participant of type <role> *)
  let l_ops_int_proj = List.map (get_ops_int_proj l_part) global.int_ops in

  (* filters by internal operations that belong to the projection of the type <role> *)
  let ops_int_belong = List.map (fun (z,_) -> z ) (List.filter (fun (_,y) -> Bool.equal y true) l_ops_int_proj) in

  (* gets internal operations that belong to the projection of the type <role> *)
  let l_ops_int_belong = List.map (get_ops_proj l_part) ops_int_belong in

  (* filters by internal operations that do not belong to the projection of the type <role> *)
  let ops_int_not_belong = List.map (fun (z,_) -> z ) (List.filter (fun (_,y) -> Bool.equal y false) l_ops_int_proj) in

  (* treats internal operations that do not belong to the projection of the type <role> *)
  let l_ops_int_not_belong = (List.map (epsilon_closure l_ops_proj global.endS) ops_int_not_belong) in

  let l_new_end_states = List.concat (List.map (fun (_,z) -> z ) (List.filter (fun (_,y) -> is_not_empty y) l_ops_int_not_belong)) in

  (* clean up when internal operations do not belong to the role type *)
  let l_new_ops_int_not_belong = List.concat (List.map (fun (z,_) -> z ) l_ops_int_not_belong) in
  
  (*  
  let rec t_print ls = match ls with
    [] -> ()
    | x :: xs -> Printf.printf "%s\n" (x |> Auto_j.string_of_operation_proj); t_print xs in
  
  t_print l_new_ops_int_not_belong;
  *)
  
  let init_to_end_ops = List.map (fun (x: Auto_t.operation_proj) -> (x.fromS, x.toS)) (List.append (List.append l_ops_proj l_ops_int_belong) l_new_ops_int_not_belong) in
  let reachable_states = reachable global.initialS init_to_end_ops in

  (* remove duplicates *)
  let cons_uniq xs x = if List.mem x xs then xs else x :: xs in
  let remove_from_left xs = List.rev (List.fold_left cons_uniq [] xs) in

  let l_states = remove_from_left reachable_states in
  (* TODO: function *)
  let useless_states = List.filter (fun x -> not (List.mem x l_states)) global.states in

  let result_endS = List.filter (fun x -> not (List.mem x l_states)) (List.append global.endS l_new_end_states) in

  let result_ops = List.filter 
    (fun (x : Auto_t.operation_proj) -> 
      Bool.(&&) (not (List.mem x.toS useless_states)) (not (List.mem x.toS useless_states)) ) 
        (List.append (List.append l_ops_proj l_ops_int_belong) l_new_ops_int_not_belong) in

  Printf.printf "useless States: %s\n" (String.concat ", " useless_states);
  Printf.printf "reachable States: %s\n" (String.concat ", " l_states);
  Printf.printf "\n"; 

  let proj : Auto_t.proj = 
  {
    id = global.id;
    role = role;
    parts = l_part;
    initialS = global.initialS;
    states = l_states;
    endS = result_endS;
    ops = result_ops;
  } in

  let string_file = Auto_j.string_of_proj proj in 
  Printf.printf "%s\n" string_file;
  Printf.printf "\n"; 
  
    Atdgen_runtime.Util.Json.to_file Auto_j.write_proj (String.cat default_path (String.cat role "_proj.json")) proj
  
;;

let main_function path =  
  let global = Atdgen_runtime.Util.Json.from_file Auto_j.read_global path in
  List.iter (proj_by_role global) global.roles;
;;

let () =
  (*Printf.printf "Global Type to Projections\n";*)
  if (Array.length (Sys.argv)) = 2 then
    main_function (Sys.argv).(1)
  else
    main_function (String.cat default_path default_json)