erlskeletor
===============

Erlang erlskeletor with a three http endpoints created with cowboy, erlang.mk and relx.

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

The root handler answers with an html that will create an [EventSource](http://www.html5rocks.com/en/tutorials/eventsource/basics/) to receive server sent events. Open your browser and go to [/](http://localhost:8080). The messages will get appended to the DOM. 
```bash
$ curl -X GET "http://localhost:8080/" 
<html>
<head>
  <meta charset="utf-8">
<body>
  <script>
    var source = new EventSource("http://localhost:8080/events")
    source.onmessage = function(message) {
      console.log("got a new message:", message.data);
      var p = document.createElement("p")
      var t =document.createTextNode(message.data);
      p.appendChild(t);
      document.body.appendChild(p);
    }
  </script>

</body>
</html>
```

You can fetch the messages sent by the server if you send a GET to /events
```bash
$ curl -X GET "http://localhost:8080/events" 
id: date
data: 2014-6-2T21:34:56Z

id: date
data: 2014-6-2T21:34:57Z

^Cfish: Job 1, “curl -X GET "http://localhost:8080/events" ” terminated by signal SIGINT (Quit request from job control (^C))
```

And at last you can GET the /foobar endpoint to receive a foo bar in JSON sauce
```bash
$ curl -X GET "http://localhost:8080/foobar" 
{"foo":"bar"}
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
