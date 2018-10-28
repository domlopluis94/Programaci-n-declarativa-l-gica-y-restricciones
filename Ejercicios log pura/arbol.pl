
binary_tree(void) .
%%%%
binary_tree(tree(Element,Left,Right)):-
	binary_tree(Left),
	binary_tree(Right).
%%%%  
tree_member(X,tree(X,tree(X,Left,Right))).
tree_member(X,tree(Y,tree(Y,Left,Right))):-
	tree_member(X,Left).
tree_member(X,tree(Y,tree(Y,Left,Right))):-
	tree_member(X,Right).
%%%%
pre_order(void,[]).
pre_order(tree(X,Left,Right),Order) :-
	pre_order(Left,OrderLeft),
	pre_order(Right,OrderRight),
	append([X|OrderLeft],OrderRight,Order).
%%%%
in_order(tree(X,Left,Right),Order) :-
	pre_order(Left,OrderLeft),
	pre_order(Right,OrderRight),
	append(OrderRight,[X|OrderLeft],Order).

