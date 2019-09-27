german([der],[determiner, nominative]).
german([den],[determiner, accusative]).
german([dem],[determiner, dative]).
german([fritz],[noun, animate]).
german([hund],[noun, animate]).
german([knochen],[noun, inanimate]).
german([liebt],[verb, transitive]).
german([gibt],[verb, ditransitive]).

german(Nounphrase, [nounphrase, subject, animate, transitive]) :-
  german(Determiner, [determiner, nominative]),
  german(Noun, [noun, animate]),
  append(Determiner, Noun, Nounphrase).



german(Nounphrase, [nounphrase, object, unmarked, transitive]) :-
  german(Determiner, [determiner, accusative]),
  german(Noun, [noun, _]),
  append(Determiner, Noun, Nounphrase).


german(Nounphrase, [nounphrase, object, animate, ditransitive]) :-
  german(Determiner, [determiner, dative]),
  german(Noun, [noun, animate]),
  append(Determiner, Noun, Nounphrase).


% vp -> v (np or cp)

german(Verbphrase, [verbphrase, subject, unmarked]):-
	german(Verb, [verb, ditransitive]),
	german(NounphraseA, [nounphrase,object,unmarked,transitive]),
	german(NounphraseB, [nounphrase, sbject,_,_]),
	append([Verb, NounphraseA, NounphraseB], Verbphrase).


german(Verbphrase, [verbphrase, subject, animate]):-
	german(Verb, [verb, ditransitive]),
	german(NounphraseA, [nounphrase,object, animate,ditransitive]),
	german(NounphraseB, [nounphrase, subject, _,_]),
	append([Verb, NounphraseA, NounphraseB], Verbphrase).

german(Verbphrase, [verbphrase, object, objects]) :-
	german(Verb, [verb, ditransitive]),
	german(NounphraseB, [nounphrase, object, animate, ditransitive]),
	german(NounphraseA, [nounphrase,object, unmarked, transitive]),
	append([Verb, NounphraseA, NounphraseB], Verbphrase).

german(Verbphrase, [verbphrase, object, objects]) :-
	german(Verb, [verb, ditransitive]),
	german(NounphraseA, [nounphrase,object, animate, ditransitive]),
	german(NounphraseB, [nounphrase, object, unmarked, transitive]),
	append([Verb, NounphraseA, NounphraseB], Verbphrase).

german(Verbphrase, [verbphrase, transitive, subject]) :-
	german(Verb, [verb, transitive]),
	german(Nounphrase, [nounphrase,object, unmarked,transitive]),
	append(Verb, Nounphrase, Verbphrase).


german(Verbphrase,[verbphrase, transitive, object]):-
	german(Verb, [verb, transitive]),
	german(Nounphrase, [nounphrase,subject,animate,transitive]),
	append(Verb, Nounphrase, Verbphrase).

 %S -> np vp 

german(Sentence,[sentence]) :-
	german(Nounphrase,[nounphrase,subject, object, animate]),
	german(Verbphrase, [verbphrase,transitive, subject, object]),
	append(Nounphrase,verbphrase, sentence).

german(Sentence,[sentence]) :-
	german(Nounphrase,[nounphrase,object, subject, animate]),
	german(Verbphrase, [verbphrase,ditransitive, objects, object]),
	append(Nounphrase,verbphrase, sentence).

german(Sentence,[sentence]) :-
	german(Nounphrase,[nounphrase,subject, object, animate]),
	german(Verbphrase, [verbphrase,ditransitive, subject, object]),
	append(Nounphrase,verbphrase, sentence).

german(Sentence,[sentence]) :-
	german(Nounphrase,[nounphrase,subject, object, animate]),
	german(Verbphrase, [verbphrase,ditransitive, animate, object]),
	append(Nounphrase,verbphrase, sentence).

german(Sentence,[sentence]) :-
	german(Nounphrase,[nounphrase,object, subject, animate]),
	german(Verbphrase, [verbphrase,ditransitive, subject, unmarked]),
	append(Nounphrase,verbphrase, sentence).
























english(Sentence, [sentence, simple]) :-
    english(Nounphrase, [nounphrase, _, nominative], [entity]),
    english(Verbphrase, [verbphrase, _, nonperception]),
    append(Nounphrase, Verbphrase, Sentence).

english(Sentence, [sentence, complex]) :-
    english(Nounphrase, [nounphrase, _, nominative], [entity]),
    english(Verbphrase, [verbphrase, _, perception]),
    append(Nounphrase, Verbphrase, Sentence).

english(Sentence, [sentence, simple]) :-
    english(Nounphrase, [nounphrase, _, nominative], [entity]),
    english(Verbphrase, [verbphrase, _, nonperception], [conjoined]),
    append(Nounphrase, Verbphrase, Sentence).

english(Sentence, [sentence, complex]) :-
    english(Nounphrase, [nounphrase, _, nominative], [entity]),
    english(Verbphrase, [verbphrase, _, perception], [conjoined]),
    append(Nounphrase, Verbphrase, Sentence).