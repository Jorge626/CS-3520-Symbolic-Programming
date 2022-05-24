% 1A. is_member
is_member(H, [H|_]).
is_member(H, [_|T]) :-
    is_member(H, T).

% 1B. is_subset
is_subset([], _).
is_subset([H|T], X):-
  is_member(H, X),
  is_subset(T, X).

% 1C. is_union
is_union([], L, L).
is_union([H|T], L2, L3) :-
        is_member(H, L2),
        is_union(T, L2, L3).
is_union([H|T], L2, [H|T3]) :-
        is_union(T, L2, T3). 

% 1D. is_intersect
is_intersect([], _, []).
is_intersect([H|T], L, L2) :-
        is_member(H, L),
        L2 = [H|T2],
        is_intersect(T, L, T2).
is_intersect([_|T], L, L2) :-
        is_intersect(T, L, L2).

% 1E. is_power
append([],L,L).
append([H|T],L,[H|T2]) :-
     append(T,L,T2).

dis(_,[],[]).
dis(X,[S|R],[[X|S]|RS]) :-
     dis(X, R, RS).

extend(X,SW,PS) :-
     dis(X,SW,SE),
     append(SW,SE,PS).

is_power([],[[]]).

is_power(S,PS) :-
     nonvar(S), 
     var(PS),
     !,
     S = [E|R],
     is_power(R,RP),
     extend(E,RP,PS),
     !.

% 2. QuickSort
quicksort( [], [] ). 
quicksort( [H|T], S ) :- 
    split_quick(H, T, L, R), 
    quicksort(L, SL), 
    quicksort(R, SR), 
    append(SL, [H|SR], S). 

split_quick( _, [], [], []). 
split_quick( H, [H2|T], [H2|LS], RS ) :- 
    H2 =< H, 
    split_quick(H, T, LS, RS). 
split_quick( H, [H2|T], LS, [H2|RS] ) :- 
    H2 > H, 
    split_quick(H, T, LS, RS). 


% 3. MergeSort
mergesort([],[]).
mergesort([H],[H]).
mergesort([H,L|T],SL) :-
    split_merge([H,L|T],L1,L2),
    mergesort(L1,S1),
    mergesort(L2,S2),
    merge(S1,S2,SL).

split_merge([],[],[]).
split_merge([H],[H],[]).
split_merge([H,L|T],[H|T1],[L|T2]) :- 
	split_merge(T,T1,T2).

merge(H,[],H).
merge([],T,T).
merge([H|R1],[T|R2],[H|M]) :- 
    H @=< T, 
    merge(R1,[T|R2],M).
merge([H|R1],[T|R2],[T|M]) :- 
    H @> T, 
    merge([H|R1],R2,M).

% 4. Prolog Practice Problem 8 are_amicable
divisor(X,_,X).
divisor(X,Y,C):- 
    A is X mod N =:= 0, 
    C is N+1, 
    Y is Y+C, 
    divisor(X,Y,C).
divisor(X,Y,C):- 
    A is X mod N =\= 0 , 
    C is N+1, 
    divisor(X,Y,C).
divisor_sum(X,Y):- 
    divisor(X,Y,1).

are_amicable(X, Y) :-
    X =:= divisor_sum(Y, _),
    Y =:= divisor_sum(X, _).

    


/* Examples
 ?- is_member(3,[1,2,3]).
 ?- is_subset([1],[1,2,3]).
 ?- is_union([1,2],[3,4],LR).
 ?- is_intersect([1,2],[2,3],LR).
 ?- is_power([1,2],LR)
 ?- mergesort([4,2,6,1,3],SL).
 ?- quicksort([4,2,6,1,3],SL).
 ?- are_amicable(220, 284)
*/
