B compiler
==========

In this repo you can find my attempt to resurrect
and reconstruct the B programming language.
The initial compiler was written in C,
after this I wrote the compiler in B itself.
This latter version has then branched off
a bit into versions for UNIX v1 and ITS on the PDP-10.

All compilers generate the original threaded code as described
[here](http://squoze.net/B/).

The state of this repo is rather chaotic right now, sorry.
It would be nice to clean up the build process,
add tests, and get rid of some code divergences.

## B compiler in C

This compiler I wrote to bootstrap B.
It is a single executable and can produce code
for PDP-11, amd64, mips32 and riscv64 assemblers.
It is good enough to compile bc.b and ba.b.

Because it is no longer necessary
I'm thinking of getting rid of it and leaving
it in the repo history.

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

## B for ITS on PDP-10

Because the PDP-10 is a word-oriented machine I had to
make the intermediate code all ASCII instead of
mixing binary and ASCII in one file.
This is probably closer to the original
and the goal is to port these changes back to the other compilers.

Platforms
=========
B has been confirmed to compile itself on the following platforms:

- Linux amd64
- Linux mips32 (ci20 devboard)
- Linux riscv64
- 2.11BSD PDP-11
- UNIX v1 PDP-11
- ITS PDP-10

TODO
====

- Get rid of chaos
- Unify compilers more, standardize ASCII intermediate code
- Throw out initial compiler written in C
- More platforms
- make mips code work on cpus with load delay

- Update and write up documentation and history
