/* This adds the entailment operator => and the 
mutual entailment operator <=> to Prolog. */

:- op(500,xfx, =>).

:- op(500,xfx,<=>).


A => B :-
	\+ (A, \+ B).


A <=> B:-
	A => B,
	B => A.
