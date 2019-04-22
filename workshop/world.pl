:- ensure_loaded(borders).
:- ensure_loaded(cities).
:- ensure_loaded(countries).
:- ensure_loaded(rivers).

country(X) :-
    country(X,_,_,_,_,_,_,_).

larger(Country1, Country2) :-
    country(Country1,_,_,_,X,_,_,_),
    country(Country2,_,_,_,Y,_,_,_),
    X > Y.

river_country(River, Country) :-
    river(River, Countries),
    member(Country, Countries),
    country(Country).

country_region(Country, Region) :-
    country(Country, Region, _, _, _, _,_,_).
%q1
list_of(_, []).
list_of(Elt, [Elt|List]) :-
    list_of(Elt, List).
%q2
all_same([]).
all_same([Elt|List]) :-
    list_of(Elt, List).
%q3
all_same2([]).
all_same2(List):-
    list_of(_, List).
%q4
adjacent(E1, E2, List):-
    append(_, [E1|E2], List).
%q5
adjacent2(E1, E2, [E1,E2|_]).
adjacent2(E1, E2, [_|Rest]):-
    adjacent2(E1, E2, Rest).

%q6
intset_member(N, tree(_, N, _)).
intset_member(N, tree(A, B, C)):-
    (N < B,
    intset_member(N, A));
    (N > B,
    intset_member(N, C)).

intset_insert(N, empty, tree(empty, N, empty)).
intset_insert(N, tree(_,N,_), tree(_,N,_)).
intset_insert(N, tree(L0,N0,R), tree(L,N0,R)):-
    N<N0,
    intset_insert(N, L0,L).
intset_insert(N, Tree(L, N0, R0), tree(L,N,R)):-
    N>N0,
    intset_insert(N, R0, R).