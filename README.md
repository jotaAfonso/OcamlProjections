# OcamlProjections

requires atdgen

atdgen -t auto.atd
atdgen -j auto.atd

dune build auto.exe

// in the _build/.. 
./auto.exe
![Screenshot from 2023-06-09 07-06-40](https://github.com/jotaAfonso/OcamlProjections/assets/49497176/e5e3b111-c2bf-4d5d-9f02-1b316b094be0)
