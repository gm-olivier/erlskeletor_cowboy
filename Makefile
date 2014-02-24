NODE ?= skeleton
REBAR ?= "./rebar"
RUN := erl -pa ebin -pa deps/*/ebin -smp enable -s lager -boot start_sasl ${ERL_ARGS}
CT_ARGS ?= "-v"

all:
	${REBAR} get-deps compile

quick:
	${REBAR} skip_deps=true compile

clean:
	${REBAR} clean

quick_clean:
	${REBAR} skip_deps=true clean

run: quick
	if [ -n "${NODE}" ]; then ${RUN} -name ${NODE}@`hostname` -s skeleton; \
	else ${RUN} -s skeleton; \
	fi

xref:
	${REBAR} skip_deps=true --verbose compile xref

tests:
	mkdir -p log/ct
	${REBAR} skip_deps=true compile ct ${CT_ARGS}
