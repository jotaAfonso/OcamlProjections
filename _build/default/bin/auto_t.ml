(* Auto-generated from "auto.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

type operation_proj = { fromS: string; toS: string; op_label: string }

type proj = {
  id: string;
  role: string;
  parts: string list;
  initialS: string;
  states: string list;
  endS: string list;
  ops: operation_proj list
}

type operation_global = {
  fromS: string;
  toS: string;
  op_label: string;
  part: string;
  new_part: bool;
  both_part: bool
}

type association = { role: string; parts: string list }

type global = {
  id: string;
  initialS: string;
  states: string list;
  endS: string list;
  ops: operation_global list;
  int_ops: operation_global list;
  roles: string list;
  role_part: association list
}
