(* Auto-generated from "auto.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type operation_proj = Auto_t.operation_proj = {
  fromS: string;
  toS: string;
  op_label: string
}

type proj = Auto_t.proj = {
  id: string;
  role: string;
  parts: string list;
  initialS: string;
  states: string list;
  endS: string list;
  ops: operation_proj list
}

type operation_global = Auto_t.operation_global = {
  fromS: string;
  toS: string;
  op_label: string;
  part: string;
  new_part: bool;
  both_part: bool
}

type association = Auto_t.association = { role: string; parts: string list }

type global = Auto_t.global = {
  id: string;
  initialS: string;
  states: string list;
  endS: string list;
  ops: operation_global list;
  int_ops: operation_global list;
  roles: string list;
  role_part: association list
}

val write_operation_proj :
  Buffer.t -> operation_proj -> unit
  (** Output a JSON value of type {!type:operation_proj}. *)

val string_of_operation_proj :
  ?len:int -> operation_proj -> string
  (** Serialize a value of type {!type:operation_proj}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_operation_proj :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> operation_proj
  (** Input JSON data of type {!type:operation_proj}. *)

val operation_proj_of_string :
  string -> operation_proj
  (** Deserialize JSON data of type {!type:operation_proj}. *)

val write_proj :
  Buffer.t -> proj -> unit
  (** Output a JSON value of type {!type:proj}. *)

val string_of_proj :
  ?len:int -> proj -> string
  (** Serialize a value of type {!type:proj}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_proj :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> proj
  (** Input JSON data of type {!type:proj}. *)

val proj_of_string :
  string -> proj
  (** Deserialize JSON data of type {!type:proj}. *)

val write_operation_global :
  Buffer.t -> operation_global -> unit
  (** Output a JSON value of type {!type:operation_global}. *)

val string_of_operation_global :
  ?len:int -> operation_global -> string
  (** Serialize a value of type {!type:operation_global}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_operation_global :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> operation_global
  (** Input JSON data of type {!type:operation_global}. *)

val operation_global_of_string :
  string -> operation_global
  (** Deserialize JSON data of type {!type:operation_global}. *)

val write_association :
  Buffer.t -> association -> unit
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

val write_global :
  Buffer.t -> global -> unit
  (** Output a JSON value of type {!type:global}. *)

val string_of_global :
  ?len:int -> global -> string
  (** Serialize a value of type {!type:global}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_global :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> global
  (** Input JSON data of type {!type:global}. *)

val global_of_string :
  string -> global
  (** Deserialize JSON data of type {!type:global}. *)

