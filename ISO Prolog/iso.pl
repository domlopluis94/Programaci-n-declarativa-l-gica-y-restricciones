%% Ejemplos ISO

listaVPos([Cabeza|Cola],Valor,Pos):-
	Pos =\= 1,
	P is Pos - 1,
	listaVPos(Cola,Valor,P).

listaVPos([Cabeza|Cola],Valor,Pos):-
	Pos =:= 1,
	igual(Valor,Cabeza).	

igual(A,A).

tamLista([Cabeza|Cola],I):-
	tamLista(Cola,I2),
	I is I2 +1.
tamLista([Cabeza|[ ]],1).


inverteir(Lista,[Valor|ColaInv]):-
	tamLista(Lista,I),
	listaVPos(Lista,Valor,I),
	I2 is I -1 , 
	inverteir(Lista,ColaInv,I2).

inverteir(Lista,[Valor|ColaInv],I):-
	I =\= 1,
	listaVPos(Lista,Valor,I),
	I2 is I -1 , 
	inverteir(Lista,ColaInv,I2).
	
inverteir(Lista,[Valor],I):-
	I =:= 1,
	listaVPos(Lista,Valor,I).

