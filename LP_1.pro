member(X, [X|_]).
member(X, [_|T]):-member(X, T).

length([], 0).
length([_|L], N):-length(L, M), N is M + 1.

append([], L, L).
append([X|L1], L2, [X|L3]):-append(L1, L2, L3).

remove(X, [X|T], T).
remove(X, [Y|T], [Y, Z]):-remove(X, T, Z).

permute([], []).
permute(L, [X|T]):-remove(X, L, Y), permute(Y, T).

sublist(S, L):-append(_, L1, L), append(S, _, L1).

delete_three_last([_, _, _], []).
delete_three_last([X|[Y, Z, U], [X|V]):-delete_three_last([Y, Z, U], V).

min_elem([X],X).
min_elem([X|T],X):-min_elt(T,Y), X<Y.
min_elem([X|T],Y):-min_elt(T,Y), X>=Y.

