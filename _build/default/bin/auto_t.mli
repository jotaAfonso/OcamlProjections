(* Auto-generated from "auto.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type operation = {
  fromState: string;
  toState: string;
  operation: string;
  participant: string;
  newParticipant: bool;
  bothParticipant: bool
}

type association = { roleID: string; participants: string list }

type auto = {
  id: string;
  initialState: string;
  states: string list;
  endStates: string list;
  operations: operation list;
  internalOperations: operation list;
  roles: string list;
  roleParticipants: association list
}
