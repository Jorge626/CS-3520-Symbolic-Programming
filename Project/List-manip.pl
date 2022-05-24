/* Run with
 ?- list_manipulator
*/

list_manipulator:-
    write('Welcome to List Manipulator v1.0!'),nl,
    write('To start list input please enter list size:'),
    read(List_size),
    get_list(L, List_size, 0),
    menu(L, 0).

get_list(L, List_size, It):-
    (   
    	dif(List_size, It) ->  
    	write('Enter element '),
        write(It),
        write(': '),
        read(Element),
        Iter is It + 1,
        L = [Element|NL],
        get_list(NL, List_size, Iter)
    ;
    L = []
    ).

menu(L, 0):-
    write('What do you want to do with the list?'),nl, 
	write('1. Sort.'),nl,
	write('2. Compute sum of elements.'),nl,
    write('3. Find greatest element.'),nl,
	write('4. Quit.'),nl,
	write('Action: '),
    read(Action),
    menu(L, Action).

menu(L, 1):-
    quicksort(L, Result),
    write('Result: '),
    write(Result),nl,
    menu(L, 0).

menu(L, 2):-
    sum(L, Result),
    write('Result: '),
    write(Result),nl,
    menu(L, 0).

menu(L, 3):-
    max(L, Result),
    write('Result: '),
    write(Result),nl,
    menu(L, 0).

menu(_, 4):-
    write('Bye!').

menu(L, _):-
    write('Error!'),nl,
    write('Please enter a valid option.'),nl,
    menu(L, 0).
    

sum([], 0).
sum([H|T], Total) :-
   sum_list(T, L),
   Total is H + L.

max([A], A).
max([H|T], N):-
    max(T, RN),
    N is max(H, RN).


quicksort( [], [] ). 
quicksort( [H|T], S ) :- 
    split(H, T, L, R), 
    quicksort(L, SL), 
    quicksort(R, SR), 
    append(SL, [H|SR], S). 

split( _, [], [], []). 
split( H, [H2|T], [H2|LS], RS ) :- 
    H2 =< H, 
    split(H, T, LS, RS). 
split( H, [H2|T], LS, [H2|RS] ) :- 
    H2 > H, 
    split(H, T, LS, RS). 


