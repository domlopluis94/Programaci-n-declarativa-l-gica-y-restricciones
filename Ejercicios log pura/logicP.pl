padre('Juan').
hijo(manolo).
esHijode(A,B):-
	padre(A),
	hijo(B).

uno(1,1,2).
dos(2,2,4).

suma(A,B,C,D):-
	uno(A,B,C1),
	dos(C1,C,D).

esmenor(0,1).
esmenor(1,2).
esmenor(2,3).
esmenor(3,4).


restar(A,B,C):-
	esmenor(A1,A),
	esmenor(B1,B),
	restar(A1,B1,C).
restar(A,1,C):-
	esmenor(C,A).
restar(0,0,0).


igualdA(A,B):-
	A =:=B.

igualdNOA(A,B):-
	A==B.


asignacion(A,C,D):-
	A is C,
	D =:= A.

asignacion2(A,C,D):-
	A =  C,
	D =:= A.

finalcola(Lista,Final):-
	arg(2,Lista,X), %cola
	finalcola(X,Final).

finalcola(Lista,Y):-
	arg(1,Lista,Y), %cabeza
	arg(2,Lista,X), %cola
	X ==  [].

likes(bill, cider).
likes(dick, beer).
likes(tom, beer).
likes(tom, cider).
likes(harry, beer).
likes(jan, cider).


not(Goal) :- call(Goal), !, fail.
not(_).

