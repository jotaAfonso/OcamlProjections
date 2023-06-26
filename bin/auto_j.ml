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

let write_operation_proj : _ -> operation_proj -> _ = (
  fun ob (x : operation_proj) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"fromState\":";
    (
      Yojson.Safe.write_string
    )
      ob x.fromS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"toState\":";
    (
      Yojson.Safe.write_string
    )
      ob x.toS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"operation\":";
    (
      Yojson.Safe.write_string
    )
      ob x.op_label;
    Buffer.add_char ob '}';
)
let string_of_operation_proj ?(len = 1024) x =
  let ob = Buffer.create len in
  write_operation_proj ob x;
  Buffer.contents ob
let read_operation_proj = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_fromS = ref (None) in
    let field_toS = ref (None) in
    let field_op_label = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'S' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 9 -> (
                match String.unsafe_get s pos with
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'S' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'e' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'o' -> (
                      if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_fromS := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_toS := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_op_label := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'S' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  match String.unsafe_get s pos with
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'S' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_fromS := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_toS := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_op_label := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            fromS = (match !field_fromS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "fromS");
            toS = (match !field_toS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "toS");
            op_label = (match !field_op_label with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "op_label");
          }
         : operation_proj)
      )
)
let operation_proj_of_string s =
  read_operation_proj (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__string_list = (
  Atdgen_runtime.Oj_run.write_list (
    Yojson.Safe.write_string
  )
)
let string_of__string_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__string_list ob x;
  Buffer.contents ob
let read__string_list = (
  Atdgen_runtime.Oj_run.read_list (
    Atdgen_runtime.Oj_run.read_string
  )
)
let _string_list_of_string s =
  read__string_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__operation_proj_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_operation_proj
  )
)
let string_of__operation_proj_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__operation_proj_list ob x;
  Buffer.contents ob
let read__operation_proj_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_operation_proj
  )
)
let _operation_proj_list_of_string s =
  read__operation_proj_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_proj : _ -> proj -> _ = (
  fun ob (x : proj) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"role\":";
    (
      Yojson.Safe.write_string
    )
      ob x.role;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"participants\":";
    (
      write__string_list
    )
      ob x.parts;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"initialState\":";
    (
      Yojson.Safe.write_string
    )
      ob x.initialS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"states\":";
    (
      write__string_list
    )
      ob x.states;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"endStates\":";
    (
      write__string_list
    )
      ob x.endS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"operations\":";
    (
      write__operation_proj_list
    )
      ob x.ops;
    Buffer.add_char ob '}';
)
let string_of_proj ?(len = 1024) x =
  let ob = Buffer.create len in
  write_proj ob x;
  Buffer.contents ob
let read_proj = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_id = ref (None) in
    let field_role = ref (None) in
    let field_parts = ref (None) in
    let field_initialS = ref (None) in
    let field_states = ref (None) in
    let field_endS = ref (None) in
    let field_ops = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 4 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                  4
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'S' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  5
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 's' then (
                  6
                )
                else (
                  -1
                )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'S' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'e' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 's' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_id := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_role := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_parts := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 3 ->
            field_initialS := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 4 ->
            field_states := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 5 ->
            field_endS := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 6 ->
            field_ops := (
              Some (
                (
                  read__operation_proj_list
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'S' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 's' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'S' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'e' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 's' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_role := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_parts := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 3 ->
              field_initialS := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 4 ->
              field_states := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 5 ->
              field_endS := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 6 ->
              field_ops := (
                Some (
                  (
                    read__operation_proj_list
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
            role = (match !field_role with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "role");
            parts = (match !field_parts with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parts");
            initialS = (match !field_initialS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "initialS");
            states = (match !field_states with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "states");
            endS = (match !field_endS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "endS");
            ops = (match !field_ops with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ops");
          }
         : proj)
      )
)
let proj_of_string s =
  read_proj (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_operation_global : _ -> operation_global -> _ = (
  fun ob (x : operation_global) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"fromState\":";
    (
      Yojson.Safe.write_string
    )
      ob x.fromS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"toState\":";
    (
      Yojson.Safe.write_string
    )
      ob x.toS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"operation\":";
    (
      Yojson.Safe.write_string
    )
      ob x.op_label;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"participant\":";
    (
      Yojson.Safe.write_string
    )
      ob x.part;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"newParticipant\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.new_part;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"bothParticipant\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.both_part;
    Buffer.add_char ob '}';
)
let string_of_operation_global ?(len = 1024) x =
  let ob = Buffer.create len in
  write_operation_global ob x;
  Buffer.contents ob
let read_operation_global = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_fromS = ref (None) in
    let field_toS = ref (None) in
    let field_op_label = ref (None) in
    let field_part = ref (None) in
    let field_new_part = ref (None) in
    let field_both_part = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'S' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 9 -> (
                match String.unsafe_get s pos with
                  | 'f' -> (
                      if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'S' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'e' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'o' -> (
                      if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 11 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                  3
                )
                else (
                  -1
                )
              )
            | 14 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'w' && String.unsafe_get s (pos+3) = 'P' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'n' && String.unsafe_get s (pos+13) = 't' then (
                  4
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'P' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 't' then (
                  5
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_fromS := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_toS := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_op_label := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 3 ->
            field_part := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 4 ->
            field_new_part := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | 5 ->
            field_both_part := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_bool
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'S' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  match String.unsafe_get s pos with
                    | 'f' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'S' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'e' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'w' && String.unsafe_get s (pos+3) = 'P' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'n' && String.unsafe_get s (pos+13) = 't' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'b' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'h' && String.unsafe_get s (pos+4) = 'P' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 't' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_fromS := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_toS := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_op_label := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              field_part := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 4 ->
              field_new_part := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 5 ->
              field_both_part := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            fromS = (match !field_fromS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "fromS");
            toS = (match !field_toS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "toS");
            op_label = (match !field_op_label with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "op_label");
            part = (match !field_part with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "part");
            new_part = (match !field_new_part with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "new_part");
            both_part = (match !field_both_part with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "both_part");
          }
         : operation_global)
      )
)
let operation_global_of_string s =
  read_operation_global (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_association : _ -> association -> _ = (
  fun ob (x : association) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"roleID\":";
    (
      Yojson.Safe.write_string
    )
      ob x.role;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"participants\":";
    (
      write__string_list
    )
      ob x.parts;
    Buffer.add_char ob '}';
)
let string_of_association ?(len = 1024) x =
  let ob = Buffer.create len in
  write_association ob x;
  Buffer.contents ob
let read_association = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_role = ref (None) in
    let field_parts = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 6 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'I' && String.unsafe_get s (pos+5) = 'D' then (
                  0
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 's' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_role := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_parts := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'I' && String.unsafe_get s (pos+5) = 'D' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_role := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_parts := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            role = (match !field_role with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "role");
            parts = (match !field_parts with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parts");
          }
         : association)
      )
)
let association_of_string s =
  read_association (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__operation_global_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_operation_global
  )
)
let string_of__operation_global_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__operation_global_list ob x;
  Buffer.contents ob
let read__operation_global_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_operation_global
  )
)
let _operation_global_list_of_string s =
  read__operation_global_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__association_list = (
  Atdgen_runtime.Oj_run.write_list (
    write_association
  )
)
let string_of__association_list ?(len = 1024) x =
  let ob = Buffer.create len in
  write__association_list ob x;
  Buffer.contents ob
let read__association_list = (
  Atdgen_runtime.Oj_run.read_list (
    read_association
  )
)
let _association_list_of_string s =
  read__association_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_global : _ -> global -> _ = (
  fun ob (x : global) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"initialState\":";
    (
      Yojson.Safe.write_string
    )
      ob x.initialS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"states\":";
    (
      write__string_list
    )
      ob x.states;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"endStates\":";
    (
      write__string_list
    )
      ob x.endS;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"operations\":";
    (
      write__operation_global_list
    )
      ob x.ops;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"internalOperations\":";
    (
      write__operation_global_list
    )
      ob x.int_ops;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"roles\":";
    (
      write__string_list
    )
      ob x.roles;
    if !is_first then
      is_first := false
    else
      Buffer.add_char ob ',';
      Buffer.add_string ob "\"roleParticipants\":";
    (
      write__association_list
    )
      ob x.role_part;
    Buffer.add_char ob '}';
)
let string_of_global ?(len = 1024) x =
  let ob = Buffer.create len in
  write_global ob x;
  Buffer.contents ob
let read_global = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_id = ref (None) in
    let field_initialS = ref (None) in
    let field_states = ref (None) in
    let field_endS = ref (None) in
    let field_ops = ref (None) in
    let field_int_ops = ref (None) in
    let field_roles = ref (None) in
    let field_role_part = ref (None) in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                  6
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                  2
                )
                else (
                  -1
                )
              )
            | 9 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'S' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                  3
                )
                else (
                  -1
                )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 's' then (
                  4
                )
                else (
                  -1
                )
              )
            | 12 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'S' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'P' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 's' then (
                  7
                )
                else (
                  -1
                )
              )
            | 18 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'O' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 'o' && String.unsafe_get s (pos+16) = 'n' && String.unsafe_get s (pos+17) = 's' then (
                  5
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_id := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 1 ->
            field_initialS := (
              Some (
                (
                  Atdgen_runtime.Oj_run.read_string
                ) p lb
              )
            );
          | 2 ->
            field_states := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 3 ->
            field_endS := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 4 ->
            field_ops := (
              Some (
                (
                  read__operation_global_list
                ) p lb
              )
            );
          | 5 ->
            field_int_ops := (
              Some (
                (
                  read__operation_global_list
                ) p lb
              )
            );
          | 6 ->
            field_roles := (
              Some (
                (
                  read__string_list
                ) p lb
              )
            );
          | 7 ->
            field_role_part := (
              Some (
                (
                  read__association_list
                ) p lb
              )
            );
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'S' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'o' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 's' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'S' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'P' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 't' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'c' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 's' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | 18 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'O' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'a' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'i' && String.unsafe_get s (pos+15) = 'o' && String.unsafe_get s (pos+16) = 'n' && String.unsafe_get s (pos+17) = 's' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_initialS := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_states := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 3 ->
              field_endS := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 4 ->
              field_ops := (
                Some (
                  (
                    read__operation_global_list
                  ) p lb
                )
              );
            | 5 ->
              field_int_ops := (
                Some (
                  (
                    read__operation_global_list
                  ) p lb
                )
              );
            | 6 ->
              field_roles := (
                Some (
                  (
                    read__string_list
                  ) p lb
                )
              );
            | 7 ->
              field_role_part := (
                Some (
                  (
                    read__association_list
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        (
          {
            id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
            initialS = (match !field_initialS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "initialS");
            states = (match !field_states with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "states");
            endS = (match !field_endS with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "endS");
            ops = (match !field_ops with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ops");
            int_ops = (match !field_int_ops with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "int_ops");
            roles = (match !field_roles with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "roles");
            role_part = (match !field_role_part with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "role_part");
          }
         : global)
      )
)
let global_of_string s =
  read_global (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
