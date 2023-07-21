# OcamlProjections

This project is complementary to [JavaParser], where taking the generated file from that project gives us the correct projections of the automaton for every role type that exists in it.

## Install
- ocaml
- atdgen

## Run 

#### *Optional

In the bin folder, produce types and code and also build the executable:
```
cd bin
```
To produce projection types definitions:
```
atdgen -t auto.atd
``` 
Build project:
``` 
dune build auto.exe 
```

To run:
```
cd ../_build/default/bin
./auto.exe  <input_file.json>
```

### Example of generated projections:
![project](https://github.com/jotaAfonso/OcamlProjections/assets/49497176/e1ca257e-c1dd-425b-9a8c-0ae85145a00c)

[JavaParser]: https://github.com/jotaAfonso/Parser
