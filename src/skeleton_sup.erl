-module(skeleton_sup).
-author('federico.carrone@inakanetworks.net').

-behaviour(supervisor).

-export([start_link/0, start_listeners/0]).
-export([init/1]).

%% admin api
start_link() -> supervisor:start_link({local, ?MODULE}, ?MODULE, {}).

start_listeners() ->
  {ok, Port} = application:get_env(skeleton, http_port),
  {ok, ListenerCount} = application:get_env(skeleton, http_listener_count),

  Dispatch =
    cowboy_router:compile(
      [ {'_',
          [
            {<<"/">>, skeleton_root_handler, []}
          ]
        }
      ]),

  RanchOptions =
    [ {port, Port}
    ],
  CowboyOptions =
    [ {env,       [{dispatch, Dispatch}]}
    , {compress,  true}
    , {timeout,   12000}
    ],

  cowboy:start_http(skeleton_http, ListenerCount, RanchOptions, CowboyOptions).

%% behaviour callbacks
init({}) ->
  {ok, { {one_for_one, 5, 10},
    [ 
      %{ChildId, StartFunc, Restart, Shutdown, Type, Modules}.
      {skeleton_http, {skeleton_sup, start_listeners, []}, permanent, 1000, worker, [skeleton_sup]}
    ]}
  }.
