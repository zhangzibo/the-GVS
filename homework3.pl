
%"1.it is circumfixation"
german([b,e,e,n],stem).
german([b,e,r,g],stem).
german([s,t,e,e,n],stem).
german([d,i,e,r], stem).

german([[g, e], [t,e]], [affix, participle]).


german(B,participle):-
  german(A,stem),
  german([X, Y], [affix, participle]),
  append([X,A,Y],B).

:- ['properties.pl'].
:- ['entailment.pl'].

%"excerise 2"



spanish([m,o,m,e,n,t],[stem]).
spanish([p,o,k], [stem]).

%"o"
spanish([P1], [affix, masculine]) :-
  phone(P1), not(cns(P1)), bck(P1), mid(P1).

%"i,k,i,t"
spanish([P1,P2],[diminutive]):-
  phone(P1), not(cns(P1)), not(mid(P1)), cnt(P1), not(low(P1)), voi(P1), str(P1), hih(P1), tns(P1), not(bck(P1)),
  phone(P2), cns(P2), not(snt(P2)), not(voi(P2)), not(cnt(P2)), not(lab(P2)), not(pal(P2)), not(nas(P2)).

spanish(A,[noun, masculine]):-
  spanish(B,[stem]),
  spanish(C,[affix, masculine]),
  append(B,C,A).


spanish(A,[stem]):-
  spanish(B,[stem]),
  spanish(C,[diminutive]),
  last(B,D),last(C,E),
  not((alv(D),not(cnt(D)),not(voi(D))) <=> (alv(E),not(cnt(E)),not(voi(E)))),
  append(B,C,A).
