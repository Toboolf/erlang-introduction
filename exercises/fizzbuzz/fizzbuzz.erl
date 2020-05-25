-module(fizzbuzz).
-export([evaluate_number/1, do_fizzbuzz/2]).

evaluate_number(Number) when (Number rem 3 =:= 0) and (Number rem 5 =:= 0) ->
  fizz_buzz;

evaluate_number(Number) when (Number rem 3) =:= 0 ->
  fizz;

evaluate_number(Number) when (Number rem 5) =:= 0 ->
  buzz;

evaluate_number(Number) ->
  Number.

do_fizzbuzz(Start, End) ->
  lists:map(fun(Number) -> evaluate_number(Number) end, lists:seq(Start, End)).
