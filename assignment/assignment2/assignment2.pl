%correspond/4
correspond(_, [], _, _).
correspond(_, _, _, []).
correspond(E1, L1, E2, L2):-
    nth0(X, L1, E1),
    nth0(Y, L2, E2),
    X == Y.

% interleave/2
heads([], []).
heads([[Head|_]|Tail_lists], Heads):-
    heads(Tail_lists, Hs),
    Heads = [Head|Hs].

tails([], []).
tails([[_|Tail]|Tail_lists], Tails):-
    tails(Tail_lists, Ts),
    Tails = [Tail|Ts].

interleave(Ls, []):-
    empty(Ls).
interleave(Ls, L):-
    heads(Ls, Heads),
    tails(Ls, Tails),
    interleave(Tails, T),
    append(Heads, T, L).

empty([]).
empty(Ls):-
    Ls = [[]|Tail_lists],
    empty(Tail_lists).