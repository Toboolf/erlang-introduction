# Introducción a Erlang

## Programación Funcional

## Erlang

* changing the value of any variable is strictly forbidden!
* Functions always returning the same result for the same parameter is called referential transparency
* purest principles (referential transparency, avoiding mutable data
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
5> 5 div 2.
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