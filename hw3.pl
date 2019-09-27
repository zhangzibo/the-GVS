:- ['fulldisplay.pl'].
:- ['properties.pl'].
:- ['entailment.pl'].

% Chantheary Soth
% LIN 177 - HW 3
% 8/27/19

% Exercise 1 Dutch collective nouns
% 1. The name of this kind of affixation is circumfixation.
% 2. A Prolog program which models this phenomenon in a principled way.
dutch([b,e,e,n],stem).
dutch([b,e,r,g],stem).
dutch([s,t,e,e,n],stem).
dutch([d,i,e,r],stem).

dutch(B, collective) :-
  dutch(A, stem),
  append([[g,e], A, [t,e]], B).


% Exercise 2 Caribbean Spanish diminutive suffixation

% roots
spanish([m,o,m,e,n,t],[stem]).
spanish([p,o,k], [stem]).

% Masculine affix -o
spanish([P1], [affix, masculine]) :-
  phone(P1), not(cns(P1)), bck(P1), mid(P1).

% One affix for the diminutive
% P1 is -i and P2 is either -t or -k
spanish([P1,P2],[diminutive]):-
  phone(P1), not(cns(P1)), voi(P1), cnt(P1),
  hih(P1),str(P1), tns(P1), not(mid(P1)), not(low(P1)),
  not(bck(P1)),
  phone(P2), cns(P2), not(snt(P2)), not(voi(P2)),
  not(cnt(P2)), not(lab(P2)), not(pal(P2)).

spanish(A,[noun, masculine]):-
  spanish(B,[stem]),
  spanish(C,[affix, masculine]),
  append(B,C,A).


spanish(A,[stem]):-
spanish(B,[stem]),
spanish(C,[diminutive]),
last(B,D),last(C,E),
not((alv(D),not(cnt(D)),not(voi(D))) <=>
(alv(E),not(cnt(E)),not(voi(E)))),
append(B,C,A).

spanish(A,[noun]):-
spanish(B,[stem]),
append(B,[a],A).
