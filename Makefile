PROJECT = erlskeletor

DEPS = cowboy lager jiffy ibrowse eper mixer sync
dep_cowboy = https://github.com/extend/cowboy.git master
dep_lager = https://github.com/basho/lager.git master
dep_jiffy = https://github.com/davisp/jiffy.git master
dep_ibrowse = https://github.com/cmullaparthi/ibrowse.git
dep_eper = https://github.com/massemanet/eper.git
dep_mixer = https://github.com/opscode/mixer.git
dep_sync = https://github.com/rustyio/sync.git

include erlang.mk

ERLC_OPTS += +'{parse_transform, lager_transform}'

RUN := erl -pa ebin -pa deps/*/ebin -smp enable -s sync -s lager -boot start_sasl ${ERL_ARGS}
NODE ?= erlskeletor

shell: app
	if [ -n "${NODE}" ]; then ${RUN} -name ${NODE}@`hostname` -s erlskeletor -config rel/sys.config; \
	else ${RUN} -s erlskeletor -config rel/sys.config; \
	fi
