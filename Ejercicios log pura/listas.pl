%member(X,[X|_]).
%member(X,[_|T]) :- member(X,T).


obtenerprimero([Valor|_],Valor).

obtenerultimo([_Pos1|T],V):-
	obtenerultimo(T,V).
obtenerultimo([V|[ ]],V).

obtener2pos([_,C|_],C).

	
	