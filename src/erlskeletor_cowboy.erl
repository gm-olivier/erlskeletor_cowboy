-module(erlskeletor_cowboy).
-author('federico.carrone@inakanetworks.net').
-behaviour(application).

-export([start/0, start/2, stop/0, stop/1]).

%% application
%% @doc Starts the application
start() ->
    application:ensure_all_started(erlskeletor_cowboy).

%% @doc Stops the application
stop() ->
    application:stop(erlskeletor_cowboy).

%% behaviour
%% @private
start(_StartType, _StartArgs) ->
    erlskeletor_cowboy_sup:start_link().

%% @private
stop(_State) ->
    ok.
