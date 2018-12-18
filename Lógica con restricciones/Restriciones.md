### Restriciones

Definen operadores especiales para expresar las restricciones
 .=. , .>. , .>=., etc.

	q(X, Y, Z) :‐ Z = f(X, Y).
		
		?‐ q(3, 4, Z).
		 Z = f(3,4).
		
		?‐ q(X, Y, f(3,4)).
		 X = 3, 
		 Y = 4.
		 
		?‐ q(X, Y, Z).
		 Z = f(X,Y).
		
	p(X, Y, Z) :‐ Z is X + Y.
		 
		?‐ p(3, 4, Z).
	 		Z = 7
	 	?‐ p(X, 4, 7).
	 		Instantiation Error

en CLP(R), 

	p(X, Y, Z) :‐ Z .=. X + Y.
	 
		?‐ p(3, 4, Z).
		 Z = 7
		 yes
		
		?‐ p(X, 4, 7).
		 X = 3
		 yes
		
		?‐ p(X, Y, 7).
		 X = 7 ‐ Y
		 yes
		
Osea con CLP(R) si se puede obtener el numero lo obtiene.

#### Dominios
Usa in para dar un dominio de rangos

	pn1(A,B,C,D,E,F,G) :‐
		A #>= 0, G #=< 10,
		B #>= A, C #>= A, D #>= A,
		E #>= B + 1, E #>= C + 2,
		F #>= C + 2, F #>= D + 3,
		G #>= E + 4, G #>= F + 1.
	
	pn1(A,B,C,D,E,F,G).
		A in 0..4, B in 0..5, C in 0..4,
		D in 0..6, E in 2..6, F in 3..9, G in 6..10

