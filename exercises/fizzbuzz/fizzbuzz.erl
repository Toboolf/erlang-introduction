-module(fizzbuzz).
-export([evaluate_number/1]).

evaluate_number(number) when (number rem 3) =:= 0 and (number rem 5 =:= 0) ->
  1.
