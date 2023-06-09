(* Auto-generated from "auto.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type operation = Auto_t.operation = {
  fromState: string;
  toState: string;
  operation: string;
  participant: string;
  newParticipant: bool;
  bothParticipant: bool
}

type association = Auto_t.association = {
  roleID: string;
  participants: string list
}

type auto = Auto_t.auto = {
  id: string;
  initialState: string;
  states: string list;
  endStates: string list;
  operations: operation list;
  internalOperations: operation list;
  roles: string list;
  roleParticipants: association list
}

val write_operation :
  Bi_outbuf.t -> operation -> unit
  (** Output a JSON value of type {!type:operation}. *)

val string_of_operation :
  ?len:int -> operation -> string
  (** Serialize a value of type {!type:operation}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_operation :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> operation
  (** Input JSON data of type {!type:operation}. *)

val operation_of_string :
  string -> operation
  (** Deserialize JSON data of type {!type:operation}. *)

val write_association :
  Bi_outbuf.t -> association -> unit
  (** Output a JSON value of type {!type:association}. *)

val string_of_association :
  ?len:int -> association -> string
  (** Serialize a value of type {!type:association}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_association :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> association
  (** Input JSON data of type {!type:association}. *)

val association_of_string :
  string -> association
  (** Deserialize JSON data of type {!type:association}. *)

val write_auto :
  Bi_outbuf.t -> auto -> unit
  (** Output a JSON value of type {!type:auto}. *)

val string_of_auto :
  ?len:int -> auto -> string
  (** Serialize a value of type {!type:auto}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_auto :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> auto
  (** Input JSON data of type {!type:auto}. *)

val auto_of_string :
  string -> auto
  (** Deserialize JSON data of type {!type:auto}. *)

