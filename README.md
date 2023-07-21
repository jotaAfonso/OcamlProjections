# OcamlProjections

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
![Screenshot from 2023-06-09 07-06-40](https://github.com/jotaAfonso/OcamlProjections/assets/49497176/e5e3b111-c2bf-4d5d-9f02-1b316b094be0)
