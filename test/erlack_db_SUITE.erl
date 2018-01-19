-module(erlack_db_SUITE).

-include_lib("common_test/include/ct.hrl").
-compile(export_all).

all() ->
    [eunit].

eunit(Config) ->
    Datadir = ?config(data_dir, Config),
    Privdir = ?config(priv_dir, Config),

    Erls =
        [ filename:join(Datadir, Name)
          || Name <- filelib:wildcard("*.erl", Datadir) ],

    up_to_date =
        make:files(
          Erls,
          [{outdir, Privdir},
           verbose,
           {d, 'TEST'},
           {d, 'EUNIT'}]),

    ok =
        eunit:test(
          [{dir, Privdir}],
          [verbose]).
