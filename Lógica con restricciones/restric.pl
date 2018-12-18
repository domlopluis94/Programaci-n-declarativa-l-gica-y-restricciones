% Ciao Prolog
:- use_package(clpr).
energia(E,M,V,H):-
	E .=. 0.5*M*V*V + 9.81*M*H.

pn1(A,B,C,D,E,F,G):-
	A .>=. 0, G .=<. 10,
	B .>=. A, C .>=. A, D .>=. A,
	E .>=. B + 1, E .>=. C + 2,
	F .>=. C + 2, F .>=. D + 3,
	G .>=. E + 4, G .>=. F + 1.

