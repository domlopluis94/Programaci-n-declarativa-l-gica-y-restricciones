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