% (A small part of) the British Royal family
parent(queen_elizabeth, prince_charles).
parent(prince_philip, prince_charles).
parent(prince_charles, prince_william).
parent(prince_charles, prince_harry).
parent(princess_diana, prince_william).
parent(princess_diana, prince_harry).
parent(prince_william, prince_george).
parent(duchess_kate, prince_george).

ancestor(Anc, Desc) :-
        parent(Anc, Desc).
ancestor(Anc, Desc) :-
        parent(Parent, Desc),
        ancestor(Anc, Parent).

grandparent(X, Z) :-
        parent(X, Y), parent(Y, Z).
