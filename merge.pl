% Base case: an empty list or a list with a single element is already sorted.
mergeSort([], []).
mergeSort([X], [X]).

% Recursive case: split the list into two halves, merge sort each half, and then merge them.
mergeSort(L1, L2) :-
    split(L1, P1, P2),
    mergeSort(P1, S1),
    mergeSort(P2, S2),
    merge(S1, S2, L2).

split(List, P1, P2) :-
    length(List, Len),
    Half is Len // 2,
    length(P1, Half),
    append(P1, P2, List).

merge([], L, L).
merge(L, [], L).
merge([X|Xs], [Y|Ys], [X|Result]) :-
    X =< Y,
    merge(Xs, [Y|Ys], Result).
merge([X|Xs], [Y|Ys], [Y|Result]) :-
    X > Y,
    merge([X|Xs], Ys, Result).
