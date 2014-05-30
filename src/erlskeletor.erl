-module(erlskeletor).
-author('federico.carrone@inakanetworks.net').

-export([start/0, start/2, stop/0, stop/1]).

%% application
%% @doc Starts the application
start() ->
    application:ensure_all_started(erlskeletor).

%% @doc Stops the application
stop() ->
    application:stop(erlskeletor).

%% behaviour
%% @private
start(_StartType, _StartArgs) ->
    erlskeletor_sup:start_link().

%% @private
stop(_State) ->
    ok.
