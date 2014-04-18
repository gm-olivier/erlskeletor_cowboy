%% @doc Handler for / endpoints
-module(erlskeletor_root_handler).

-export(
  [
   init/3,
   allowed_methods/2,
   content_types_provided/2,
   is_authorized/2
  ]).

-export(
  [
    handle_get/2
  ]).

%% cowboy
init(_Transport, _Req, _Opts) ->
    {upgrade, protocol, cowboy_rest}.

allowed_methods(Req, State) ->
    {[<<"GET">>], Req, State}.

content_types_provided(Req, State) ->
    {[{{<<"application">>, <<"json">>, []}, handle_get}], Req, State}.

is_authorized(Req, State) ->
    {true, Req, State}.

%% internal
handle_get(Req, State) ->
    Body = jiffy:encode({[{<<"status">>, <<"ok">>}]}),
    lager:info("holas"),
    {Body, Req, State}.
