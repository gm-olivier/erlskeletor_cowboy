-module(erlskeletor_root_handler).
-include_lib("mixer/include/mixer.hrl").

-export([
         handle_get/2
        ]).

-mixin([
        {erlskeletor_base,
         [
          init/3,
          allowed_methods/2,
          content_types_provided/2,
          is_authorized/2
         ]
        }
       ]).

handle_get(Req, State) ->
    Body = <<"
<!DOCTYPE html>
<html>
<head>
  <meta charset=\"utf-8\"/>
</head>
<body>
  <script>
    var source = new EventSource(\"http://localhost:8080/events\")
    source.onmessage = function(message) {
      console.log(\"got a new message:\", message.data);
      var p = document.createElement(\"p\")
      var t =document.createTextNode(message.data);
      p.appendChild(t);
      document.body.appendChild(p);
    }
  </script>
</body>
</html>
">>,
    {Body, Req, State}.
