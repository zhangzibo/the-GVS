:- ['properties.pl'].
:- ['entailment.pl'].

spanish([m,o,m,e,n,X], [stem]) :-
    phone(X), cns(X), alv(X), not(voi(X)), not(sib(X)).
spanish([p,o,X], [stem]) :-
    phone(X), cns(X), vel(X), not(voi(X)).

spanish([i,X], [suffix, diminutive]):-
	phone(X), not(voi(X)), not(cnt(X)),
        not(lab(X)), not(pal(X)).

spanish([o], [suffix, masculine]).

spanish(A, [stem]) :-
	spanish(B, [suffix, diminutive]),
	spanish(C, [stem]),
	last(C, D),
	last(B, E),
	not(homorganic(D, E)),
	append(C, B, A).
	
homorganic(A, B) :-
	alv(A) <=> alv(B),
	vel(A) <=> vel(B).

spanish(A, [noun, masculine]) :-
	append(B, C, A),
	spanish(B, [stem]),
	spanish(C, [suffix, masculine]).

/* Alternate:

?- ['properties.pl'].

spanish([m,o,m,e,n,t], [stem]).
spanish([p,o,k], [stem]).

spanish([i,X], [suffix, diminutive]):-
	phone(X), not(voi(X)), not(cnt(X)), not(lab(X)),
        not(pal(X)).

spanish([o], [suffix, masculine]).

spanish(A, [stem]) :-
	append(C, B, A),
	spanish(B, [suffix, diminutive]),
	spanish(C, [stem]),
	last(C, D),
	last(B, E),
	not(D = E).
	
spanish(A, [noun, masculine]) :-
	append(B, C, A),
	spanish(B, [stem]),
	spanish(C, [suffix, masculine]).

*/