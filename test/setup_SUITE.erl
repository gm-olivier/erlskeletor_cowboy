-module(setup_SUITE).
-include_lib("common_test/include/ct.hrl").

-export([all/0]).

-export([
         init_per_suite/1,
         end_per_suite/1
        ]).

-export([
         application_should_be_started/1
        ]).

all() ->
    [
     application_should_be_started
    ].

init_per_suite(Config) ->
    ibrowse:start(),
    erlskeletor_cowboy:start(),
    {ok, Port} = application:get_env(erlskeletor_cowboy, http_port),
    Url = "http://localhost:" ++ integer_to_list(Port),
    [ {url, Url} | Config ].

application_should_be_started(Config) ->
    Headers = [{content_type, "application/json"}],
    {ok, StatusCode, _ResponseHeaders , _Body} = ibrowse:send_req(?config(url, Config), Headers, get),
    "200" = StatusCode.

end_per_suite(_Config) ->
    erlskeletor_cowboy:stop(),
    ibrowse:stop().
