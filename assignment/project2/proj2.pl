% Author: Qielu Yu, qieluy@student.unimelb.edu.au
% Student number: 962682

% The objective of this project is to practice and 
% assess understanding of logic programming and Prolog.

% A maths puzzle is a square grid of squares, each to be filled in with 
% a single digit 1–9 (zero is not permitted) satisfying these constraints:
% • each row and each column contains no repeated digits;
% • all squares on the diagonal line from upper left to lower right contain 
%   the same value;
% • the heading of reach row and column (leftmost square in a row and topmost 
%   square in a column) holds either the sum or the product of all the digits 
%   in that row or column


:- ensure_loaded(library(clpfd)).

% diagonal/3
% Get the diagonal vuale, the number of row is the index on each row.
diagonal([H|_], 0, H).
diagonal([_|T], Row, Diag):-
    Row1 is Row - 1,
    diagonal(T, Row1, Diag).


% diagonal/3
% The diagonal values should be same
diagonal_constraint([], _, _).
diagonal_constraint([Hs|Ts], Row, Diag):-
    diagonal(Hs, Row, Diag),
    Row1 is Row + 1,
    diagonal_constraint(Ts, Row1, Diag).

% row_sum/2
% calculate the sum of a row
row_sum([], 0).
row_sum([H|T], X):-
    between(1, 9, H),
    row_sum(T, X1),
    X is H + X1.

% row_pro/2
% calculate the product of a row
row_product([],1).
row_product([H|T], X):-
    between(1, 9, H),
    row_product(T, X1),
    X is X1 * H.

% row/1
% check if the heading value equals to the sum or product in a row.
% the structure of the matrix shows that the heading row and column are the 
% the sum or product.
row([Value|Row]):-
    row_sum(Row, Value);
    row_product(Row, Value).

% row_constraint/1
% apply the row/1 to each row
% the elements of a row should be distinct
row_constraint([]).
row_constraint([Hs|Ts]):-
    row(Hs),
    all_distinct(Hs),
    row_constraint(Ts).

% puzzle_solution/1
% the requied answer of the project.
% apply the constraint method of diagonal, rows and columns
% transpose the rows to columns, the first column is the sum or product.
puzzle_solution([H|T]):-
    diagonal_constraint(T, 1, _),
    transpose([H|T], [_|Col]),
    row_constraint(T),
    row_constraint(Col),
    maplist(labeling([]),[H|T]).



