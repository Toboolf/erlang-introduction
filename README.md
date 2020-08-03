# Introducción a Erlang

## Programación Funcional

* changing the value of any variable is strictly forbidden!
* Functions always returning the same result for the same parameter is called referential transparency
* purest principles (referential transparency, avoiding mutable data
 
## Erlang

* Erlang uses the actor model,
* each actor is a separate process in the virtual machine.
* if you were an actor in Erlang's world, you would be a lonely person, sitting in a dark room with no window, waiting by your mailbox to get a message. 
* Once you get a message, you react to it in a specific way
* it means you can ask many people to perform very specific tasks for you, and none of them will ever do something wrong or make mistakes which will have repercussions on the work of others; they may not even know the existence of people other than you (and that's great).
* actor = process
* Erlang is also a development environment as a whole
* The code is compiled to bytecode and runs inside a virtual machine
* The standard distribution includes (among others) development tools (compiler, debugger, profiler, test framework), the Open Telecom Platform (OTP) Framework, a web server, a parser generator, and the mnesia database, a key-value storage system able to replicate itself on many servers, supporting nested transactions and letting you store any kind of Erlang data.
* The VM and the libraries also allow you to update the code of a running system without interrupting any program
* distribute your code with ease on many computers and manage errors and faults in a simple but powerful manner
* related general policy in Erlang: Let it crash
* There is still a small cost in sending a message from actor to actor, and if you divide tasks too much, you will make things slower!
* randomly throwing parallelism at a problem is not enough to make it go fast.
* Erlang is also said to be able to scale in a directly proportional manner to how many cores your computer has, but this is usually not true
* particularly bad at things like image and signal processing, operating system device drivers, etc
* shine at things like large software for server use (i.e.: queues, map-reduce), doing some lifting coupled with other languages, higher-level protocol implementation, etc.

## installation
* asdf - brew

## shell
* end with dot each expression

## tipos de datos

### numbers
* Erlang doesn't care if you enter floating point numbers or integers: both types are supported when dealing with arithmetic
* If you want to express integers in other bases than base 10, just enter the number as Base#Value (given Base is in the range 2..36) `2#101010.`

```erlang
1> 2 + 15.
17
2> 49 * 100.
4900
3> 1892 - 1472.
420
4> 5 / 2.
2.5
5> 5 div 2. %% integer division
2
6> 5 rem 2.
1
```

### Variables

* Variables are not variable
* Start with uppercase
* Variables can be assignated once
* `_` variable is always ubbound, it won't store any value

```erlang
1> One.
* 1: variable 'One' is unbound
2> One = 1.
1
3> Un = Uno = One = 1.
1
4> Two = One + One.
2
5> Two = 2.       
2
6> Two = Two + 1.
** exception error: no match of right hand side value 3
7> two = 2.
** exception error: no match of right hand side value 2
```

### Atoms

* constants with their own name for value
* What you see is what you get
* The atom cat means "cat" and that's it. You can't play with it, you can't change it, you can't smash it to pieces; it's cat.
* palabras clave (semtantizar el código)
* starting with lowercase for single words
* An atom should be enclosed in single quotes (') if it does not begin with a lower-case letter or if it contains other characters than alphanumeric characters, underscore (_), or @.
* An atom is therefore mainly useful to express or qualify data coupled with it.
* an atom is referred to in an "atom table" which consumes memory (4 bytes/atom in a 32-bit system, 8 bytes/atom in a 64-bit system)
* The atom table is not garbage collected
* 1048577 atoms were declared.
* Atoms should be seen as tools for the developer because honestly, it's what they are.

```erlang
1> atom.
atom
2> atoms_rule.
atoms_rule
3> atoms_rule@erlang.
atoms_rule@erlang
4> 'Atoms can be cheated!'.
'Atoms can be cheated!'
5> atom = 'atom'.
atom
```

> Note: some atoms are reserved words and can not be used except for what the language designers wanted them to be: function names, operators, expressions, etc. These are: after and andalso band begin bnot bor bsl bsr bxor case catch cond div end fun if let not of or orelse query receive rem try when xor

### Tuplas

* Agrupar datos cuando sabes cuántos son
* `{Elemento1, Elemento2, ..., ElementoN}`

Ejemplo: coordenadas de un plano bidimensional

```erlang
X = 1, Y = 2.
Coordenada = {X, Y}.
```

* Una variable (ej. `Coordenada`) puede contener a muchas otras.

Obtener datos de una tupla:

```erlang
{A, _} = Coordenada.
A = 1. % Ok

{_, _} = {1, 2}. % Ok
{_, _} = {1, 2, 3}. % ** exception error: no match of right hand side value {1,2,3}
```

Dar contexto a nuestros datos:

```erlang
Temperatura_mexico = {celsius, 27.5}.
Temperatura_us = {kelvin, 88.2}.

{kelvin, Grados} = Temperatura_mexico.
% ** exception error: no match of right hand side value {celsius,23.213}
```

La tupla puede contener cualquier elemento de cualquier tipo:

```erlang
{temperatura_local, {celsius, 28.4}}.
```

### Listas

* Las listas son la uña y mugre de los lenguajes funcionales.
* Pueden contener **¡lo que sea!**, números, átomos, tuplas, otras listas, etc.
* De la forma: `[Elemento1, Elemento2, ..., ElementoN]`

Añadir listas y eliminar elementos: 

```erlang
[1, 2, 3] ++ [4, 5].
% [1, 2, 3, 4, 5]
```