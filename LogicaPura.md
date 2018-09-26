# Logica Pura

Para entender esta parte bien hay que pensar que trabajamos sobre un lienzo en blanco y por tanto todo lo que queramos usar tendremos que crearlo nosotros.

El primer paso sera la creación de "base de datos logica" (logic Database) y "base de datos relacional".

Para verlo de la forma mas clara posble vamos a ver un ejemplo:- 
  padre(juan). 
  hijo(manolo). 

vale que vemos aqui, hemos creado la relacion padre con juan y hijo con manolo. si a ciao le preguntamos hijo(manolo retornara yes). 
Ahora para que me podria servir esto, pues por ejemlo para crear la estructura eshijode
  esHijode(A,B):-
	padre(A),
	hijo(B).

