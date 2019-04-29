%correspond/4
correspond(E1, [E1|_], E2, [E2|_]).
correspond(E1, [_|Rest1], E2, [_|Rest2]):-
    correspond(E1, Rest1, E2, Rest2).
    

% interleave/2
interleave([], []).
interleave([[]|Xs], []):-
    interleave(Xs, []).
interleave([X|Xs], [Y|Ys]):-
    head([X|Xs],[Y|Ys], Xrest, Yrest),
    interleave(Xrest, Yrest).
% get all the heads of the list of lists
head([], Yrest, [], Yrest).
head([[X|Xs]|Xss], [X|Ys], [Xs|Xrest], Yrest):-
    head(Xss, Ys, Xrest, Yrest).

%partial_eval/4
partial_eval(Expr0,Var,Val,Expr):-
    ground(Expr0),
    ground(Var),
    ground(Val),
    \+ground(Expr),
    atom(Var),
    number(Val),
    ((Expr0 = Var,Val = Expr); 
    ((atom(Expr0); number(Expr0)), Expr0 \= Var,Expr0 = Expr)).
partial_eval(+(A,B),Var,Val,E):-
    partial_eval(A,Var,Val,C),partial_eval(B,Var,Val,D),
    ((number(C),number(D),E is +(C,D));(\+ (number(C),number(D)),E = +(C,D))).
partial_eval(-(A,B),Var,Val,E):-
    partial_eval(A,Var,Val,C),partial_eval(B,Var,Val,D),
    ((number(C),number(D),E is -(C,D));(\+ (number(C),number(D)),E = -(C,D))).
partial_eval(*(A,B),Var,Val,E):-
    partial_eval(A,Var,Val,C),partial_eval(B,Var,Val,D),
    ((number(C),number(D),E is *(C,D));(\+ (number(C),number(D)),E = *(C,D))).
partial_eval(/(A,B),Var,Val,E):-
    partial_eval(A,Var,Val,C),partial_eval(B,Var,Val,D),
    ((number(C),number(D),E is /(C,D));(\+ (number(C),number(D)),E = /(C,D))).
partial_eval(//(A,B),Var,Val,E):-
    partial_eval(A,Var,Val,C),partial_eval(B,Var,Val,D),
    ((number(C),number(D),E is //(C,D));(\+ (number(C),number(D)),E = //(C,D))).
