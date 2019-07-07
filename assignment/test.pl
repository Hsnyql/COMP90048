listof(_, []).
listof(Elt, [Elt|List]):-
    listof(Elt, List).

allsame([]).
allsame(List):-
    list(_Elt, List).

adjacent(E1, E2, List):-
    append(_, [E1,E2|_], List).

adjacent(E1, E2, [E1,E2|List]).
adjacent(E1, E2, [_|List]):-
    adjacent(E1, E2, List).

before(E1, E2, [E1|List]):-
    member(E2, List).

before(E1, E2, [_|List]):-
    before(E1, E2, List).

intset_member(N, tree(_,N,_)).
intset_member(N, tree(L, N0, _)):-
    N < N0,
    intset_member(N, L).
intset_member(N, tree(_,N0,R)):-
    N > N0,
    intset_member(N, R).

intset_insert(N, empty, tree(empty,N,empty)).
intset_insert(N, tree(_,N,_), tree(_,N,_)).
intset_insert(N, tree(L0,N0,R), tree(L,N0,R)):-
    N < N0,
    intset_insert(N, L0, L).

intset_insert(N, tree(L,N0,R0), tree(L.N0.R)):-
    N > N0,
    intset_insert(N, R0,R).

sumList(List, Sum):-
    sumList(List, 0, Sum).
sumList([], Sum, Sum).
sumList([X|Xs], Acc, Sum):-
    Acc1 is Acc + X,
    sumList(Xs. Acc1, Sum).

tree(empty).
tree(node(Left,_,Right)):-
    tree(Left),
    tree(Right).

tree_list(empty, []).
tree_list(node(L,M,R), List):-
    tree_list(L, Listl),
    tree_list(R, Listr),
    append(Listl, [M|Listr], List).

tree_list1(Tree, List):-
    tree_list1(Tree, [], List).

tree_list1(empty, List, List).
tree_list1(node(L,M,R), Acc0, List):-
    tree_list1(L, Acc1, List),
    Acc1 = [M|Acc2],
    tree_list1(R, Acc0, Acc2).

list_tree([], empty).
list_tree(List, node(L,M,R)):-
    append(ListL, [M|ListR], List),
    length(ListL, Len),
    length(ListR, Len),
    list_tree(ListL, L),
    list_tree(ListR, R).

same_elements(L1, L2):-
    all_in(L1, L2),
    all_in(L2, L1).

all_in([], _).
all_in([E|Es], L):-
    member(E, L),
    all_in(Es,L).

same_elements1(L1,L2):-
    sort(L1, Sorted),
    sort(L2, Sorted).




tree_list(empty, []).
tree_list(node(Left, M,Right), List):-
    tree_list(Left,List1),
    tree_list(Right, List2),
    append(List1, [M|List2], List).

tree_list(empty, List, List).
tree_list(node(Left, M, Right), Acc0, List):-
    tree_list(Right, Acc0, Acc1),
    tree_list(Left, [M|Acc1], List).