-module(erlskeletor_events_handler).
-export([
         init/3,
         info/3,
         terminate/2
        ]).

init(_Transport, Req, _Opts) ->
    Headers = [{<<"content-type">>, <<"text/event-stream">>}],
    {ok, Req2} = cowboy_req:chunked_reply(200, Headers, Req),
    erlang:send_after(1000, self(), {message, "Tick"}),
    {loop, Req2, undefined}.

terminate(_Req, _State) ->
    ok.

info({message, Msg}, Req, State) ->
    ok = cowboy_req:chunk(["id: hola", "\ndata: ", Msg, "\n\n"], Req),
    erlang:send_after(1000, self(), {message, "Tick"}),
    {loop, Req, State}.
