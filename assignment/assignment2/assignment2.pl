%correspond/4
correspond(E1, [E1|_], E2, [E2|_]).
correspond(E1, [_|Rest1], E2, [_|Rest2]):-
    correspond(E1, Rest1, E2, Rest2).
    

% interleave/2
% heads([], []).
% heads([[Head|_]|Tail_lists], Heads):-
%     heads(Tail_lists, Hs),
%     Heads = [Head|Hs].

% tails([], []).
% tails([[_|Tail]|Tail_lists], Tails):-
%     tails(Tail_lists, Ts),
%     Tails = [Tail|Ts].

% interleave(Ls, []):-
%     empty(Ls).
% interleave(Ls, L):-
%     heads(Ls, Heads),
%     tails(Ls, Tails),
%     interleave(Tails, T),
%     append(Heads, T, L).

% empty([]).
% empty(Ls):-
%     Ls = [[]|Tail_lists],
%     empty(Tail_lists).

head([], Yrest, [], Yrest).
head([[X|Xs]|Xss], [X|Ys], [Xs|Xrest], Yrest):-
    head(Xss, Ys, Xrest, Yrest).

interleave([], []).
interleave([[]|Xs], []):-
    interleave(Xs, []).
interleave([X|Xs], [Y|Ys]):-
    head([X|Xs],[Y|Ys], Xrest, Yrest),
    interleave(Xrest, Yrest).

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
partial_eval(Expr0,Var,Val,Expr):-
    ground(Expr0),
    ground(Var),
    ground(Val),
    \+ground(Expr),
    atom(Var),
    number(Val),
    ((Expr0 = Var,Val = Expr); 
    ((atom(Expr0); number(Expr0)), Expr0 \= Var,Expr0 = Expr)).

factorial(1,1).
factorial(N, Res):-
    N > 0,
    N1 is N - 1,
    factorial(N1, Res1),
    Res is N * Res1.

square(E1, E2):- E2 is E1 * E1.