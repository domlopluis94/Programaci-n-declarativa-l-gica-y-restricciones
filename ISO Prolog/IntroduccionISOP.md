#ISO PROLOG
Es superior a la logica de primer orden, lo esta gracias al uso de recursos como operaciones aritmeticas. 

## Aritmética/Igualdad y Asignación  

+ + , > , < , - , / , //

Todo lo que sea operaciones aritmeticas tiene que tener numeros 

	plus(X,Y,Z):- Z is X + Y

En cuento me falta X o Y dara Error

Casos 
si x esta ligado con 3 , e Y con 4 

	Y < X+1, X is Y+1, X =:=Y. 
 	No 
 	
ahora
 
	Y < a+1, X is Y+1, X =:=Y. 
	Error
	
#### Igualdad aritmética 

* =/= desigual
* =:= igual

		igualdA(A,B):-
		A =:=B.
		
		?- igualdA(2,4).
		no
		?-  igualdA(2,A).
		{ERROR: arithmetic:=:=/2, arg 1 - instantiation_error}
		no
		?-  igualdA(2,a).
		{ERROR: arithmetic:=:=/2, arg 1 - expected an arithmetically evaluable expression, found a}
		no
	

#### Igualdad no aritmetica 

* ==
* \==

		igualdNOA(A,B):-
		A==B.
		
		?- igualdNOA(A,B).
		no
		?- igualdNOA(3,B).
		no
		?- igualdNOA(3,a).
		no
		?- igualdNOA(a,a).
		yes
		?- igualdNOA(3,3).	
		yes
Tambien tenemos @> , @>= , @=<, @<

		?- f(a) @> f(b). %Fails
		?- f(b) @> f(a). %Succeeds
		?- f(X) @> f(Y). %Implementation dependent!

####Asignación 

* is
			
		asignacion(A,C,D):-
		A is C,
		D =:= A.
		
		?- aignacion(A,3,D).
		{ERROR: user:aignacion/3 - existence error: procedure:user:aignacion/3 does not exist}
		
		no
		?-  asignacion(A,3,D).
		{ERROR: arithmetic:=:=/2 - instantiation_error}
		
		no
		?- asignacion(A,C,D).
		{ERROR: arithmetic:$+/2 - instantiation_error}
		
		no
		?- asignacion(A,3,3).
		
		A = 3 ? 
		
		yes
		?- asignacion(3,C,D).
		{ERROR: arithmetic:$+/2 - instantiation_error}
	
		no
		



## Comprobar predicados 
Usando estas herramientas como comprobacion en los predicados podemos evitar que retorne Error y que nos retorne un NO. Pero importante estos predicados no te dan numeros al azar, solo valen para validar una variable. 

* integer(x)
* float(x)
* number(x)
* atom(x) 	constante que no sea un numero
* atomic(x) 	atom o numero 

## Estructuras especiales 

### Functor (X,F,A)

* X = Termino(args)
* F = Termino
* A = Aridad

		?- functor(asignacion(Z,4,4),F,A).
		A = 3,
		F = asignacion ? 	
		yes

### ARG (N,X,Arg)

* N = es un integer que contiene la pocicion del termino que queremos en arg
* X = es la var que esta compuesta por el termino con los argumentos 
* Arg = argumento en la pos N

		T= date(9,February,1947), 
		arg(3,T,1947)
	
Especial para listas:

		arg(2,[a,b,c,d],X) 
		X= [b,c,d] 
		
		?- arg(3,[a,b,c,d],X).
		no
		?- arg(1,[a,b,c,d],X). 
		X = a ? 
		yes
		
		?-  arg(2,[a],X) .
		X = [] ? 
		yes

Osea en listas realmente solo me da la cabecera y su cola, si quiero recorrer usando arg tendria que llamar de forma recursiva a su cola con el primer ejemplo arg(2,[a,b,c,d],X) llamando a X.

		finalcola(Lista,Final):-
			arg(2,Lista,X), %cola
			finalcola(X,Final).
		
		finalcola(Lista,Y):-
			arg(1,Lista,Y), %cabeza
			arg(2,Lista,X), %cola
			X ==  [].
			
		?- finalcola([a,b,c,d],Final).	
		Final = d ? ;	
		no


* uso de functor y arg juntos
		
		?-  functor(Array,array,5),
		arg(1,Array,black),
		arg(5,Array,white).
		      
		Array = array(black,_,_,_,white) ? 
		
		yes
		
### =..    "univ"
Permite pasar una estructura a lista

* L is the decomposition of a term T into a list comprising its principal functor followed by its arguments.

		?- date(9,february,1947) =.. L.
		
			L = [date,9,february,1947].
			
		?- _F = ’+’, 
		X =.. [_F,a,b].		
			X = a + b.
		

### Metalogicos

Me permiten saber si una variable esta instanciada 

* var(X) , true si X es libre
* nonvar(X) , no libre
* ground(X) , si esta completamente instanciada (osea no puede contener variables en su interior)

### Comparacion 

* == igual
* /== desigual (/ es al contrario , mirar ejemplo)

		X=Y cierto
		X==Y falso
		X\=Y falso dos variables libre siempre unifican
		X\==Y cierto

Unificacion con =

		asignacion2(A,C,D):-
			A =  C,
			D =:= A.
			
		?- asignacion2(A,3,3).
		A = 3 ? 	
		yes
		?- asignacion2(3,C,3).
		C = 3 ? 
		yes
		?- asignacion2(A,3,D).
		{ERROR: arithmetic:=:=/2 - instantiation_error}
		no

### Findall , bagof y setof

* findall(Term, Goal, ListResults): ListResults is the set of all instances of
Term such that Goal is satisfied

		likes(bill, cider).
		likes(dick, beer).
		likes(tom, beer).
		likes(tom, cider).
		likes(harry, beer).
		likes(jan, cider).

		?- findall(X, likes(X,Y), S).
		S = [bill,dick,tom,tom,harry,jan] ? ;
		no
		
		?-  findall(X, likes(X,water), S).
		S = [] ? 
		yes
		
		?-  findall(X, likes(X,cider), S).
		S = [bill,tom,jan] ? 
		yes

* setof(Term, Goal, ListResults): ListResults is the ordered set (no
duplicates) of all instances of Term such that Goal is satisfied
setof no nos da elementos repetidos 

		?- setof(X, likes(X,Y), S).

		S = [dick,harry,tom],
		Y = beer ? ;
		
		S = [bill,jan,tom],
		Y = cider ? ;
		
		no
		
		?-  setof((Y,S), setof(X, likes(X,Y), S), SS).
		SS = [(beer,[dick,harry,tom]),(cider,[bill,jan,tom])] ? 
		yes
		
		?- setof(X, Y^(likes(X,Y)), S).
		S = [bill,dick,harry,jan,tom] ? ;
		no

* bagof/3 same, but returns list unsorted and with duplicates (in backtracking
order)

		?- bagof(X, likes(X,Y), S).
		
		S = [dick,tom,harry],
		Y = beer ? ;
		
		S = [bill,tom,jan],
		Y = cider ? .
		
		no


### Negacion 
#### /+ 
Si no esta instanciado no se asegura que funcione correctamente 
	 \+ member(c, [a,k,l]).
		yes
		{trace}
como C no se encuentra , da error

#### ! corte
Caso con not 

	not(Goal) :- call(Goal), !, fail. %rama 1
	not(Goal).							 %rama 2

	?- not(likes(bill,cide)).
	yes
	?- not(likes(bill,cider)).
	no
	
Vamos a darle al debug para verlo mejor, cuando le pasamos un caso cierto como likes(bill,cider) lo primero que hace es llamar a call(likes(bill,cider)) que nos retorna true/exit , al pasar eso pone la señal de corte y llama a fail. Esto lo hace porque quiere que nos retorne siempre un fail cuando call retorne un true. El corte nos permite hacer que el programa deje de buscar otras posibles ramas (si buscase otra veria la rama 2 que es siempre true y devolveria true).
	
	?- not(likes(bill,cider)).
	   1  1  Call: user:not(likes(bill,cider)) ? 
	   2  2  Call: basiccontrol:,(internals:rt_module_exp(likes(bill,cider),goal,user(/Users/luisdominguez/Google Drive/Universidad/Actuales/Prácticas/git/Programacion-declarativa-logica-y-restricciones/Ejercicios log pura/logicP),-,true,_5877),hiord_rt:call(_5877)) ? 
	   3  3  Call: user:likes(bill,cider) ? 
	   3  3  Exit: user:likes(bill,cider) ? 
	   2  2  Exit: basiccontrol:,(internals:rt_module_exp(likes(bill,cider),goal,user(/Users/luisdominguez/Google Drive/Universidad/Actuales/Prácticas/git/Programacion-declarativa-logica-y-restricciones/Ejercicios log pura/logicP),-,true,user:likes(bill,cider)),hiord_rt:call(user:likes(bill,cider))) ? 
	   4  2  Call: basiccontrol:fail ? 
	   4  2  Fail: basiccontrol:fail ? 
	   1  1  Fail: user:not(likes(bill,cider)) ? 
		
	no
	{trace}
	
Caso yes, cuando le pasamos likes(bill,cide), caso que no existe porque le falta la r a cider, cuando se realiza la llamada a call esta retorna false y no llega al corte, por lo que busca una segunda rama y encuentra la 2 que sirve para confirmar siempre.	
	
	?- not(likes(bill,cide)).
	   1  1  Call: user:not(likes(bill,cide)) ? 
	   2  2  Call: basiccontrol:,(internals:rt_module_exp(likes(bill,cide),goal,user(/Users/luisdominguez/Google Drive/Universidad/Actuales/Prácticas/git/Programacion-declarativa-logica-y-restricciones/Ejercicios log pura/logicP),-,true,_5875),hiord_rt:call(_5875)) ? 
	   3  3  Call: user:likes(bill,cide) ? 
	   3  3  Fail: user:likes(bill,cide) ? 
	   2  2  Fail: basiccontrol:,(internals:rt_module_exp(likes(bill,cide),goal,user(/Users/luisdominguez/Google Drive/Universidad/Actuales/Prácticas/git/Programacion-declarativa-logica-y-restricciones/Ejercicios log pura/logicP),-,true,_5875),hiord_rt:call(_5875)) ? 
	   1  1  Exit: user:not(likes(bill,cide)) ? 
		
	yes
	{trace}

