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
Ejemplo de la ejecución :

	esHijode(juan,manolo).
		yes
		
Ejemplo ejecución para optener el hijo
	
	esHijode(X,manolo).
		X = juan ? 
		yes

Vamos a fijarnos bien en lo que hemos echo, hemos declarado unos tipos y unas estructuras, luego con esas declaraciones hemos echo un programa que nos comprueba o nos retorna un padre o un hijo en función de lo que le pasemos. 
Si hubieramos querido poner los nombre en mayuscula tendriamos que usar 'Juan' ya que si usasemos una mayuscula ciao nos reconoceria como una variable y daria error. 
Hablando de variables, en prolog las variables una vez se asignan no se pueden modificar, por ello se tienen que usar otras variables para seguir guardando el valor. Veamos un ejemplo del uso de variables dentro de programas fijaros en C1

	uno(1,1,2).
	dos(2,2,4).
	suma(A,B,C,D):-
		uno(A,B,C1),
		dos(C1,C,D).
---Ejec

	?- suma(1,1,2,D).
	D = 4 ? 
	yes
	
Uno da el resultado de 1+1=2 en su tercer argumento /aridad3 
Dos da el resultado de 2+2=4 en su tercer argumento /aridad3
Suma():-/aridad4 por su parte realiza la suma. lo normal seria en uno poner D  en uno D = A + B , D= D + C pero aqui si hacemos eso en dos nos realizaria la comparación dos(2,2,2) y daria NO.

# Recursividad

# Listas

# Arboles
