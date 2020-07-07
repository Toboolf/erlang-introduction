-module(division_recursive).

%% Hacer una división sin usar operadores aritméticos sin usar operadores
divide_numbers(Dividend, Divisor) when (Divisor > 0) ->
  divide(Dividend, Divisor, 0, 0).

divide(Dividend, Divisor, Sum, Count) when Sum =< Dividend ->
  io:format("Sum: ~w, Count: ~w~n", [Sum, Count]),
  divide(Dividend, Divisor, Sum + Divisor, Count + 1);

divide(Dividend, Divisor, Sum, Count) ->
  io:format("Final Sum: ~w, Count: ~w~n", [Sum, Count]),
  {Count - 1, (Dividend - Sum) + Divisor}.

%% 10 / 5
%% c = 1, 5 > 10 si
%% c = 2, 10 > 10 no-
%%
%% 10 / 3
%% sobra 1
%% 1 sumarlo 10 = 10
%% dividir 10 / Divisor = 3 , residuo 1

