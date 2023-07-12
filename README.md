B compiler
==========

Here you can find three B compilers.
One written in C and one written in B itself.
Both generate the original threaded code as described
[here](http://squoze.net/B/).

The state of this repo is rather chaotic right now. sorry.

## B compiler in C

This compiler I wrote to bootstrap B.
It is a single executable and can produce code
for PDP-11, amd64, mips32 and riscv64 assemblers.
It is good enough to compile bc.b and ba.b.

## B compiler in B

This one is the real deal.
It works in two phases.
`bc.b` compiles a B file to an intermediate format
and `ba.b` further processes it to assembly.
Except for word size the first pass should mostly be
platform independent.
The second pass is assembler and to some degree platform
dependent.

## B for UNIX v1

Having discovered a few B binaries I set out to
reconstruct the B compiler as closely as I could
and get it to run on UNIX v1.
You can find the result in the `unix1_bdir` directory.

Platforms
=========
B has been confirmed to compile itself on the following platforms:

- Linux amd64
- Linux mips32 (ci20 devboard)
- Linux riscv64
- 2.11BSD PDP-11

TODO
====

- Get rid of chaos
- More platforms
- make mips code work on cpus with load delay
