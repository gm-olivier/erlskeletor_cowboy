PROJECT = skeleton

DEPS = cowboy lager jiffy
dep_cowboy = https://github.com/extend/cowboy.git master
dep_lager = https://github.com/basho/lager.git master
dep_jiffy = https://github.com/davisp/jiffy.git master

include erlang.mk
