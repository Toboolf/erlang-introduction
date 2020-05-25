-module(fizzbuzz).
-export([do_fizzbuzz/1]).

evaluate_number(Number) when (Number rem 3 =:= 0) and (Number rem 5 =:= 0) ->
  fizz_buzz;

evaluate_number(Number) when (Number rem 3) =:= 0 ->
  fizz;

evaluate_number(Number) when (Number rem 5) =:= 0 ->
  buzz;

evaluate_number(Number) ->
  Number.

do_fizzbuzz(End) ->
  iterate(End, []).

iterate(0, Final_list) -> Final_list;

iterate(Current_number, Final_list) ->
  iterate(Current_number - 1, [evaluate_number(Current_number)|Final_list]).

