#ISO PROLOG
Es superior a la logica de primer orden, lo esta gracias al uso de recursos como operaciones aritmeticas. 

## Aritmética 

+,>,<,

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

## Comprobar predicados 
Usando estas herramientas como comprobacion en los predicados podemos evitar que retorne Error y que nos retorne un NO.

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

### ARG (N,X,Arg)

* N = es un integer que contiene la pocicion del termino que queremos en arg
* X = es la var que esta compuesta por el termino con los argumentos 
* Arg = argumento en la pos N

		T= date(9,February,1947), arg(3,T,1947)
		arg(2,[a,b,c,d],X) 
		X= [b,c,d] 

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


### Findall , bagof y setof

findall(Term, Goal, ListResults): ListResults is the set of all instances of
Term such that Goal is satisfied

setof(Term, Goal, ListResults): ListResults is the ordered set (no
duplicates) of all instances of Term such that Goal is satisfied
setof no nos da elementos repetidos 

bagof/3 same, but returns list unsorted and with duplicates (in backtracking
order)


### Negacion 
#### /+ 
Si no esta instanciado no se asegura que funcione correctamente 

#### ! corte