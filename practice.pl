
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
:- ['fulldisplay.pl'].

%"excerise 2"

spanish([m,o,m,e,n,t],[stem]).
spanish([p,o,k], [stem]).

%"o"
spanish([P1], [affix, masculine]):-
  phone(P1), not(cns(P1)), bck(P1), mid(P1).

%"i,t, i,k"
spanish([P1,P2],[diminutive]):-
  phone(P1), not(cns(P1)), voi(P1), cnt(P1),  hih(P1),str(P1), tns(P1), not(mid(P1)), not(low(P1)),  not(bck(P1)),
  phone(P2), cns(P2), not(snt(P2)), not(voi(P2)),  not(cnt(P2)), not(lab(P2)), not(pal(P2)).


spanish(A,[noun, masculine]):-
  append(B,[stem]),
  spanish(B,C,A),
  spanish(C,[affix, masculine]).


spanish(A,[stem]):-
  spanish(B,[stem]),
  spanish(C,[diminutive]),
  last(B,D),last(C,E),
  not((alv(D),not(cnt(D)),not(voi(D))) <=> (alv(E),not(cnt(E)),not(voi(E)))),
  append(B,C,A).

spanish(A,[noun]):-
spanish(B,[stem]),
append(B,[a],A).

english(b,P1,d):-
  phone(P1), not(cns(P1)), snt(P1), voi(P1), cnt(P1), low(P1), str(P1).
english(b,P1,d):-
  phone(P1), not(cns(P1), snt(P1) ,voi(P1), cnt(P1), hih(P1), str(P1).
english(s, p, P2, tʃ):-
  phone(P2), not(cns(P2)), snt(P2), voi(P2), cnt(P2), hih(P2), tns(P2), str(P2).
english(s, p, P2, tʃ):-
  phone(P2), not(cns(P2)), snt(P2), voi(P2), cnt(P2), hih(P2), tns(P2), str(P2).

  english(s, p, P2, tʃ) :-
  phone(P2), not(cns(P2)), snt(P2), voi(P2), cnt(P2), hih(P2), tns(P2), str(P2).
english(s, p, P2, tʃ) :-
  phone(P2), not(cns(P2)), snt(P2), voi(P2), cnt(P2), hih(P2), tns(P2), str(P2).



 % man
german([Fritz], [noun, singular, unmarked], [entity]).

  % dog
german([Hund], [noun, singular, unmarked], [entity]).

  % bone
german([Knochen], [noun, singular, unmarked], [accuse_entity]).


  % loves
german([liebt], [verb, transitive]).

  % gives
german([gibt], [verb, transitive]).

  % the-nominative
german([der], [determiner], [nominative]).

  % the-accusative
german([den], [determiner],[accusative]).

  %the-dative
german([dem], [determiner], [dative]).




german(Nounphrase, [nounphrase, simple, nominative], [Type]) :-
    german(Nounphrase, [noun, _, nominative], [Type]).

german(Nounphrase, [nounphrase, simple, accusative], [Type]) :-
    german(Nounphrase, [noun, _, accusative], [Type]).

german(Nounphrase, [nounphrase, simple, dative], [Type]) :-
    german(Nounphrase, [noun, _, dative], [Type]).



german(Nounphrase, [nounphrase, simple, nominative], [Type]) :-
    german(Determiner, [determiner, _]),
    german(Noun, [noun, _, unmarked], [Type]),
    append(Determiner, Noun, Nounphrase).

german(Nounphrase, [nounphrase, simple, nonnominative], [Type]) :-
    german(Determiner, [determiner, _]),
    german(Noun, [noun, _, unmarked], [Type]),
    append(Determiner, Noun, Nounphrase).

german(Nounphrase, [nounphrase, complex, nominative], [Type]) :-
    german(Determiner, [determiner, _]),
    german(Noun, [noun, _, unmarked], [Type]),
    german(PrepPhrase, [prepphrase]),
    append([Determiner, Noun, PrepPhrase], Nounphrase).

german(Nounphrase, [nounphrase, complex, nonnominative], [Type]) :-
    german(Determiner, [determiner, _]),
    german(Noun, [noun, _, unmarked], [Type]),
    german(PrepPhrase, [prepphrase]),
    append([Determiner, Noun, PrepPhrase], Nounphrase).



german(Verbphrase, [verbphrase, transitive]) :-
    german(Verb, [verb, transitive]),
    german(Nounphrase, [nounphrase, _, nonnominative], [entity]),
    append(Verb, Nounphrase, Verbphrase).




german(PrepPhrase, [prepphrase]) :-
    german(Preposition, [preposition], [Type]),
    german(Nounphrase, [nounphrase, simple, _], [Type]),
    append(Preposition, Nounphrase, PrepPhrase).



german(Sentence, [sentence]) :-
    german(Nounphrase, [nounphrase, _, nominative], [entity]),
    german(Verbphrase, [verbphrase, _]),
    append(Nounphrase, Verbphrase, Sentence).



np -> (det) n (pp)
   vp -> v (np or cp)
   pp -> P np
   S -> np vp 
   cp -> comp S
   

german([der],[determiner, nominative]).
german([den],[determiner, accusative]).
german([dem],[determiner, dative]).
german([fritz],[noun, animate]).
german([hund],[noun, animate]).
german([knochen],[noun, inanimate]).
german([liebt],[verb, transitive]).
german([gibt],[verb, ditransitive]).

% nounphrase
% determiner nominative - subject
% der fritz/der hund AND not(der knochen) - the bone cannot give or love something
german(Nounphrase, [nounphrase, subject, animate, transitive]) :-
  german(Determiner, [determiner, nominative]),
  german(Noun, [noun, animate]),
  append(Determiner, Noun, Nounphrase).

% determiner accusative - object
% den fritz/den hund/den knochen
german(Nounphrase, [nounphrase, object, unmarked, transitive]) :-
  german(Determiner, [determiner, accusative]),
  german(Noun, [noun, _]),
  append(Determiner, Noun, Nounphrase).

% determiner dative - the object that is also the recipient - the bone cannot receive something
% dem fritz/dem hund
german(Nounphrase, [nounphrase, object, animate, ditransitive]) :-
  german(Determiner, [determiner, dative]),
  german(Noun, [noun, animate]),
  append(Determiner, Noun, Nounphrase).

% liebt
% verbphrase
% liebt der fritz, leibt der hund

% liebt den hund, liebt den fritz, liebt den knochen


% gibt
% verb obj obj - gibt den dem or gibt dem den

% verb obj subj - gibt den der
german(Verbphrase, [verbphrase, subject, unmarked]) :-
  
%  verb obj subj - gibt dem der
german(Verbphrase, [verbphrase, subject, animate]) :-


%The subject verb order happens here! Just append them the legal way. 
% subj verb obj obj
german(Sentence,[sentence]) :-

% obj verb obj subj
german(Sentence, [sentence]) :-
