-module(hanoi_towers).

% [1,2,3,4]
% [h|t]
%
% 3 espacios para colocar torres, en uno esta la torre completa al inicio
%
% Torre_1 = [1,2,3]
% Torre_2 = []
% Torre_3 = []
%
% Mover los números de Torre_1 a Torre_3 en orden y de uno por uno
%
% 1,2,3
%
% mover de torre 1 a torre 3 el 1
% t1 = [2,3]
% t2 = []
% t3 = [1]
% mover de torre 1 a torre 2 el 2
% t1 = [3]
% t2 = [2]
% t3 = [1]
% mover de torre 3 a torre 2 el 1
% t1 = [3]
% t2 = [1,2]
% t3 = []
% mover de torre 1 a torre 3 el 3
% t1 = []
% t2 = [1,2]
% t3 = [3]
% mover de torre 2 a torre 1 el 1
% t1 = [1]
% t2 = [2]
% t3 = [3]
% mover de torre 2 a torre 3 el 2
% t1 = [1]
% t2 = []
% t3 = [2,3]
% mover de torre 1 a torre 3 el 1
% t1 = []
% t2 = []
% t3 = [1,2,3]

% Torre_1 = [1,2,3].
% Torre_2 = [].
% Torre_3 = [].

move_disk_tower1([H|T], Tower) ->
  {T--[H], [H|Tower]}.

next_move({[H1 | T1], [H2 | []], [H3|[]]}) when H3 > H2 ->
  {[H1|T1], [], [H2|[H3]]};

next_move({[H1 | T1], [], []}) ->
  {T1--[H1], [H1], []};

next_move({[H1 | T1], [H2 | []], []}) ->
  {T1--[H1], [H2], [H1]}.

% next move last disk 3, to another tower -> [3], [], [1,2]

do_hanoi() ->
  1.



