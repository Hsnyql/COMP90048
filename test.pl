myappend([], C, C).
myappend([A|B], C, [A|BC]) :- 
    myappend(B, C, BC).

len1([], 0).
len1([_A|B], N):-
    len1(B, N1),
    N is N1 + 1.

take1(0, _, []).
take1(N, List, Front):-
    append(Front,_,List),
    len1(Front, N).

drop(0, _, []).
drop(N, List, Back):-
    len1(Back, N),
    append(_, Back, List).


mem1(Elt, List):- append(_, [Elt|_], List).

mem2(Elt, [Elt|_]).
mem2(Elt, [_|Rest]):-
    mem2(Elt, Rest).


rev1([],[]).
rev1([A|BC], CBA):-
    rev1(BC, CB),
    append(CB, [A], CBA).

fact(N, F):- fact1(N, 1, F).
fact1(0, A, A).
fact1(N, A, F):-
    N > 0,
    N1 is N - 1,
    A1 is N * A,
    fact1(N1, A1, F).

multiply(0, _, A, A).
multiply(X, Y, A, XY):-
    X1 is X - 1,
    A1 is Y + A,
    multiply(X1, Y, A1, XY).

multiply1(X, Y, XY):- multiply(X, Y, 0, XY).

rev([],A, A).
rev([B|CD],A,DCBA):-
    rev(CD, [B|A],DCBA).

filter(_, [], []).
filter(Pred, [X|Xs], Filtered):-
    (call(Pred, X)->
    Filtered = [X|Filtered1];
    Filtered = Filtered1),
    filter(Pred, Xs, Filtered1).