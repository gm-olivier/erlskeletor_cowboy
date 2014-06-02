-module(erlskeletor_foobar_handler).
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
    Body = jiffy:encode({[{foo, bar}]}),
    {Body, Req, State}.
