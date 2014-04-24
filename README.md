erlskeletor
===============

Erlang erlskeletor with a root cowboy handler, common test, erlang.mk and relx

![](https://gs1.wac.edgecastcdn.net/8019B6/data.tumblr.com/fc0f50ca1bd995498d9ddf28c95b8fe5/tumblr_mr9nrvPZ1R1s46h7vo1_1280.jpg)


#Run it!
To download dependencies and compile everything:
```bash
make
```
To run the erlang shell and launch everything
```bash
make shell
```

To have your changes autocompiled, purged and loaded run sync:go() at the erlang shell
```bash
(erlskeletor@localhost)1> sync:go().
Scanning source files...
ok
(erlskeletor@localhost)2> 14:12:55.374 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/error_logger_lager_h.erl:0: Recompiled.
14:12:55.464 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager.erl:0: Recompiled.
14:12:55.511 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_app.erl:0: Recompiled.
14:12:55.532 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_backend_throttle.erl:0: Recompiled.
14:12:55.552 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_config.erl:0: Recompiled.
14:12:55.595 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_console_backend.erl:0: Recompiled.
14:12:55.667 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_crash_log.erl:0: Recompiled.
14:12:55.699 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_default_formatter.erl:0: Recompiled.
14:12:55.842 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_file_backend.erl:0: Recompiled.
14:12:55.882 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_handler_watcher.erl:0: Recompiled.
14:12:55.950 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_transform.erl:0: Recompiled.
14:12:56.086 [info] /home/pyotrgalois/projects/erlskeletor/deps/lager/src/lager_util.erl:0: Recompiled.
14:12:56.089 [info] error_logger_lager_h: Reloaded! (Beam changed.)
14:12:56.090 [info] lager: Reloaded! (Beam changed.)
14:12:56.091 [info] lager_app: Reloaded! (Beam changed.)
14:12:56.092 [info] lager_backend_throttle: Reloaded! (Beam changed.)
14:12:56.093 [info] lager_config: Reloaded! (Beam changed.)
14:12:56.094 [info] lager_console_backend: Reloaded! (Beam changed.)
14:12:56.095 [info] lager_crash_log: Reloaded! (Beam changed.)
14:12:56.095 [info] lager_default_formatter: Reloaded! (Beam changed.)
14:12:56.097 [info] lager_file_backend: Reloaded! (Beam changed.)
14:12:56.098 [info] lager_handler_watcher: Reloaded! (Beam changed.)
14:12:56.100 [info] lager_util: Reloaded! (Beam changed.)
```

 
To execute the [release](http://www.erlang.org/doc/design_principles/release_structure.html#id75723)
```bash
_rel/bin/erlskeletor console 
```

#Why?
- [Erlang Factory 2014 -- Keynote Catalyse Change](http://youtu.be/Djv4C9H9yz4)
- [Why I use erlang.mk instead of rebar](https://medium.com/p/708597c0dd08)
- [Build Tools - Make, no more](http://hadihariri.com/2014/04/21/build-make-no-more/)

#Propaganada
- [Spawned Shelter](https://github.com/pyotrgalois/spawnedshelter)
