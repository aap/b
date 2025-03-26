# B Compiler for PDP-10

`bc10.b` and `ba10.b` are the B compiler and assembler for ITS.
`bc10.b` is generated elsewhere from `bc10.BB` to replace symbolic
constants. It would be nice to do this on ITS eventually.

STINKB is a slightly modified STINK 201 that can be used more
comfortably from a VALUE string and understands an empty SNAME
to mean the current SNAME.

# Build instructions

Copy this whole directory to ITS under name `B` (e.g. by means of itstar/DUMP)
All B code necessary to boostrap the system has been pre-compiled
to assembly.

; do everything in the B directory
:CWD B

; assemble runtime, pre-compiled B library, and STINKB
:MIDAS BRT
:MIDAS BLIB S
:MIDAS PRINTN S
:MIDAS PRINTF S
:MIDAS TS STINKB_STINKB

; assemble & link pre-compiled B compiler
:MIDAS MAIN_BC10 S
:STINKB BDUMP
:RENAME TS BOUT,TS BC

; assemble & link pre-compiled B assembler
:MIDAS MAIN_BA10 S
:STINKB BDUMP
:RENAME TS BOUT,TS BA

; build BJ command
:BC BJ
:BA BJ
:MIDAS MAIN_BJ S
:STINKB BDUMP
:RENAME TS BOUT,TS BJ

; optional: re-compile pre-compiled B library using new compiler
:BC BLIB
:BA BLIB
:MIDAS BLIB S

:BC PRINTN
:BA PRINTN
:MIDAS PRINTN S

:BC PRINTF
:BA PRINTF
:MIDAS PRINTF S

; BJ can now build TS BOUT from HELLO B from any directory
:CWD AAP
:B;BJ HELLO
:BOUT
hello world
