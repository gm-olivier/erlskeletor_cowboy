erlskeletor
===============

Erlang erlskeletor with a root cowboy handler, common test, erlang.mk and relx

![](https://gs1.wac.edgecastcdn.net/8019B6/data.tumblr.com/fc0f50ca1bd995498d9ddf28c95b8fe5/tumblr_mr9nrvPZ1R1s46h7vo1_1280.jpg)


#Run it!
To download dependencies and compile everything:
```bash
make
```
To run the erlang shell and launch everything:
```bash
make shell
```

The changes you do to the source code are autocompiled, purged and loaded when while you are developing and using make shell thanks to [sync](https://github.com/rustyio/sync). [The -s sync flag in this line from the Makefile](https://github.com/pyotrgalois/erlskeletor/blob/master/Makefile#L-16) is responsible for starting sync. Remove it if you don't like it.

At the erlang shell you will see the following messages when sync recompiles your code:
```bash
(erlskeletor@pyotrgaloiss-MacBook-Air.local)2> 18:55:07.143 [info] /Users/pyotrgalois/projects/erlskeletor/src/erlskeletor_root_handler.erl:0: Recompiled.
18:55:07.150 [info] erlskeletor_root_handler: Reloaded! (Beam changed.)
```

To execute the [release](http://www.erlang.org/doc/design_principles/release_structure.html#id75723) recompile with make and call _rel/bin/erlskeletor console:
```bash
make
_rel/bin/erlskeletor console 
```

#Why?
- [Erlang Factory 2014 -- Keynote Catalyse Change](http://youtu.be/Djv4C9H9yz4)
- [Why I use erlang.mk instead of rebar](https://medium.com/p/708597c0dd08)
- [Build Tools - Make, no more](http://hadihariri.com/2014/04/21/build-make-no-more/)

#Propaganada
- [Spawned Shelter](https://github.com/pyotrgalois/spawnedshelter)
