%%%%%
sumPares(Lista,Sol):-
	separaPares(Lista,Pares,_),
	suma(Pares,Sol).

%%%%Suma dos listas y retorna el valor total de la suma 
sumaListas(Lista1,Lista2,Suma):-
	suma(Lista1,S),
	suma(Lista2,S2),
	Suma is (S+S2).
suma([],0).
suma([Cabecera|Cola],Cabecera) :-
	Cola==[].
suma([Cabecera|Cola],S2) :-
	Cola\==[],
	suma(Cola,S),
	S2 is Cabecera+S.


%%MAyor de una lista
mayor([Cabecera|Cola],Cabecera) :-
	Cola==[].

mayor([Cabecera|Cola],S2) :-
	Cola\==[],
	mayor(Cola,S),
	Cabecera>=S,
	S2 =  Cabecera.

mayor([Cabecera|Cola],S2) :-
	Cola\==[],
	mayor(Cola,S),
	Cabecera<S,
	S2 = S.

%%%%Separa los elementos pares de los impares de una lista 
separaPares([],[],[]).
separaPares([Digito|Lista],[Digito],[]) :-
	Lista==[],
	integer(Digito),
	0 is Digito mod 2.
separaPares([Digito|Lista],[],[Digito]) :-
	Lista==[],
	integer(Digito),
	1 is Digito mod 2.
separaPares([Digito|Lista],[Digito|Pares],Impares) :-
	Lista\==[],
	integer(Digito),
	0 is Digito mod 2,
	separaPares(Lista,Pares,Impares).
separaPares([Digito|Lista],Pares,[Digito|Impares]) :-
	Lista\==[],
	integer(Digito),
	1 is Digito mod 2,
	separaPares(Lista,Pares,Impares).

%%%%Numero de seguridad

claveSeguridad(Dni,Constante,Nalgoritmos,ClavePropia):-
			ClavePropia is (Dni*Constante) mod Nalgoritmos. 

% factorial/2 realiza el factorial del primer parametro que debe ser un numero entero mayor o igual a 0, y devuelve el resultado de hacer el factorial de ese numero en el segundo parametro
factorial(0,1).
factorial(X,Y) :-
	integer(X),
	X>0,
	Z is X-1,
	factorial(Z,Z2),
	Y is X*Z2.