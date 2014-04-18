erlskeletor
===============

Erlang erlskeletor with a root cowboy handler, common test, rebar and a simple makefile

![](https://gs1.wac.edgecastcdn.net/8019B6/data.tumblr.com/fc0f50ca1bd995498d9ddf28c95b8fe5/tumblr_mr9nrvPZ1R1s46h7vo1_1280.jpg)
---

To download dependencies and compile everything:
```bash
make
```
 
To compile everything and run the application:
```bash
erl -pa ebin -pa deps/*/ebin -smp enable -s lager -boot start_sasl -s erlskeletor -config config/erlskeletor.config
```

To run tests:
```bash
make tests
```

