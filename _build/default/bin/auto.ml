open Core

let () =
  
  (* Read JSON file into an OCaml string *)
  let json = In_channel.read_all "auto.json" in 
  
  let auto = json |> Auto_j.auto_of_string in
  
  printf "Tests\n";
  printf "Id: %s\n" auto.id;
  printf "Initial State: %s\n" auto.initialState;
  printf "States: %s\n" (String.concat ~sep:", " auto.states);
  printf "End States: %s\n" (String.concat ~sep:", " auto.endStates);
  
  let roleP = 	match auto.roleParticipants with 
  		| [] -> "no associations"
  		| x::_ -> x |> Auto_j.string_of_association in
  printf "Association: %s\n" roleP;
