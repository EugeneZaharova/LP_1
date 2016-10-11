% Принадлежность элемента списку
member(X, [X|_]).
member(X, [_|T]):-member(X, T).

% Длина списка
length([], 0).
length([_|L], N):-length(L, M), N is M + 1.

% Слияние списков
append([], L, L).
append([X|L1], L2, [X|L3]):-append(L1, L2, L3).

% Удаление элемента из списка
remove(X, [X|T], T).
remove(X, [Y|T], [Y, Z]):-remove(X, T, Z).

% Перестановка элементов в списке
permute([], []).
permute(L, [X|T]):-remove(X, L, Y), permute(Y, T).

% Подсписок
sublist(S, L):-append(_, L1, L), append(S, _, L1).

% Удаление последнего элемента списка
delete(L1,L2):-append(L2, [_], L1).

% Удаление трех последних элементов списка (без стандартных предикатов)
delete_three_last([_], []).
delete_three_last([X|[Y, Z, U], [X|V]):-delete(Y, V), delete(Z, V), delete(U, V).

% Удаление трех последних элементов списка (для порядкового представления)
delete_last_three(N, [(N, _, _, _)|L], L).
delete_last_three(N, [(M, X, Y, Z)|L], [(M, X, Y, Z)|T]):-delete_last_three(N, L, T).
delete_last_three(L1, L2):-length(L1,N), delete_last_three(N, L1, L2).

% Нахождение минимального элемента списка (без стандартных предикатов)
min_elem([X], X).
min_elem([X|T], X):-min_elem(T, Y), X<Y.
min_elem([X|T], Y):-min_elem(T, Y), X>=Y.

% Нахождение минимального элемента списка (для порядкового представления)
min_element([X], X).
min_element([(_, X)|L], X):-min_element(
