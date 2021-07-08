B compiler
==========

Here you can find two B compilers.
One written in C and one written in B itself.
Both generate the original threaded code as described
[here](http://squoze.net/B/).

The state of this repo is rather chaotic right now. sorry.

## B compiler in C

This compiler I wrote to bootstrap B.
It is a single executable and can produce code
for PDP-11, amd64 and mips32 assemblers.
On amd64 and mips32 it is good enough to compile bc.b and ba.b.
On PDP-11 it should also produce good code,
but it needs some testing.

pdp-8 output should be mostly working, runtime not started yet.

## B compiler in B

This one is the real deal.
It works in two phases.
`bc.b` compiles a B file to an intermediate format
and `ba.b` further processes it to assembly.
Except for word size the first pass should mostly be
platform independent.
The second pass is assembler and to some degree platform
dependent.

TODO
====

- Get rid of chaos
- More platforms
- make mips code work on cpus with load delay
