% A arbol
% L lista de nodos
% anchura(A,L)./2
anchura(A,L):-
	niveles([A],L).	
%% hijos (As,Hs,Ns)/3
% AS lista de arboles
% Hs sunarnoles
% Ns Nodos raiz
%hijos(As,Hs,Ns).
hijos([],[],[]).
hijos([A|As],Subtrees,Nodos):-
	subarbol(A,Subtrees,Nodos),
	hijos(As,RestsubTrees,RestNodos),
	append(SubTree,RestsubTrees,SubTree),
	append(Nodos,RestNodos, Nodos).
%subarbol
subarbol(tree(R,I,D),[I,D],[R]).
subarbol(void,[],[]).

niveles([],[]).
niveles([A|As],L):-
	hijos([A|As],Subtree,Nodos),
	niveles(Subtree,RestNodos),
	append(Nodos,RestNodos,L).

%%%%%%-----------------------------------------%%%%%%%%%%%
%%% acumular los nodos solo del nivel del numero que toque 
nodosprof(A,N,L):-
	nodos_nivel(N,[A],L).
%%%AS arboles al mismo nivel
%nodos_nivel(N,As,Nodes)
nodos_nivel(0,As,Nodos):-
	hijos(As,_,Nodos).
nodos_nivel(s(N),As,Nodos):-
	hijos(As,SubTrees,_),
	nodos_nivel(N,SubTrees,Nodos).

