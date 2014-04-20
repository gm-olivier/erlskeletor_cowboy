PROJECT = erlskeletor

DEPS = cowboy lager jiffy ibrowse eper mixer
dep_cowboy = https://github.com/extend/cowboy.git master
dep_lager = https://github.com/basho/lager.git master
dep_jiffy = https://github.com/davisp/jiffy.git master
dep_ibrowse = https://github.com/cmullaparthi/ibrowse.git
dep_eper = https://github.com/massemanet/eper.git
dep_mixer = https://github.com/opscode/mixer.git

include erlang.mk

ERLC_OPTS += +'{parse_transform, lager_transform}'
