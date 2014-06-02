-module(erlskeletor_events_handler).
-export([
         init/3,
         info/3,
         terminate/3
        ]).

init(_Transport, Req, _Opts) ->
    Headers = [{<<"content-type">>, <<"text/event-stream">>}],
    {ok, Req2} = cowboy_req:chunked_reply(200, Headers, Req),
    erlang:send_after(1000, self(), {message, human_readable_date()}),
    {loop, Req2, undefined}.

terminate(_Reason, _Req, _State) ->
    ok.

info({message, Msg}, Req, State) ->
    ok = cowboy_req:chunk(["id: date", "\ndata: ", Msg, "\n\n"], Req),
    erlang:send_after(1000, self(), {message, human_readable_date()}),
    {loop, Req, State}.

% internal
human_readable_date() ->
    TimeStamp = os:timestamp(),
    {{Year, Month, Day}, {Hour, Minute, Second}} = calendar:now_to_universal_time(TimeStamp),
    DateList = io_lib:format("~p-~p-~pT~p:~p:~pZ", [Year, Month, Day, Hour, Minute, Second]),
    list_to_binary(DateList).
