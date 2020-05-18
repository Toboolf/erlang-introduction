-module(fizzbuzz).
-export([evaluate_number/1]).

evaluate_number(Number) when (Number rem 3 =:= 0) and (Number rem 5 =:= 0) ->
  fizz_buzz;

evaluate_number(Number) when (Number rem 3) =:= 0 ->
  fizz;

evaluate_number(Number) when (Number rem 5) =:= 0 ->
  buzz.

