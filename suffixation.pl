?- ['fulldisplay.pl'].

spanish([m,o,m,e,n,t],[stem]).

spanish([i,t],[affix, diminutive]).

spanish([o],[affix, masculine]).

spanish(A,[noun, masculine]):-
	append(B,C,A),
	spanish(B,[stem]),
	spanish(C,[affix, masculine]).

spanish(A,[stem]):-
	append(B,C,A),
	spanish(C,[affix, diminutive]),
	spanish(B,[stem]).



turkish([e,v],[root]).

turkish([d,e,n,i,z],[root]).

turkish([e,l],[root]).

turkish([l,e,r],[plural]).

turkish([i,m],[person,first]).

turkish([i,n],[person,second]).

turkish([i,z],[number,plural]).

turkish([d,e],[case,locative]).

turkish([i],[case,accusative]).

turkish([d,e,n],[case,ablative]).

turkish([i,n],[case,genitive]).

turkish([l,e],[case,instrumental]).

turkish(A,[stem]):-
	turkish(A,[root]).

turkish(A,[stem]):-
	turkish(B,[root]),
	turkish(C,[plural]),
	append(B,C,A).

turkish(A,[base]):-
	turkish(A,[stem]).

turkish(A,[base]):-
	turkish(B,[stem]),
	turkish(C,[possessor]),
	append(B,C,A).

turkish(A,[noun]):-
	turkish(A,[base]).

turkish(A,[noun]):-
	turkish(B,[base]),
	turkish(C,[case|_]),
	append(B,C,A).

turkish(A,[possessor]):-
	turkish(A,[person|_]).

turkish(A,[possessor]):-
	turkish(B,[person|_]),
	turkish(C,[number|_]),
	append(B,C,A).
