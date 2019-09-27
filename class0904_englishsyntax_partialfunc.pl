:- ['fulldisplay.pl'].

/* Basic English syntax example */

 % the
english([the], [determiner, direct]).

  % man
english([man], [noun, singular, unmarked], [entity]).

  % dog
english([dog], [noun, singular, unmarked], [entity]).

  % park
english([park], [noun, singular, unmarked], [location]).

  % she
english([she], [noun, singular, nominative], [entity]).

  % he
english([he], [noun, singular, nominative], [entity]).

  % her
english([her], [noun, singular, nonnominative], [entity]).

  % him
english([him], [noun, singular, nonnominative], [entity]).

  % bites
english([bites], [verb, transitive, nonperception]).

  % sleeps
english([sleeps], [verb, intransitive, nonperception]).

  % thinks
english([thinks], [verb, transitive, perception]).

  % in
english([in], [preposition], [location]).

  % that
english([that], [complementizer]).






english(Nounphrase, [nounphrase, simple, nominative], [Type]) :-
    english(Nounphrase, [noun, _, nominative], [Type]).

english(Nounphrase, [nounphrase, simple, nonnominative], [Type]) :-
    english(Nounphrase, [noun, _, nonnominative], [Type]).

english(Nounphrase, [nounphrase, simple, nominative], [Type]) :-
    english(Determiner, [determiner, _]),
    english(Noun, [noun, _, unmarked], [Type]),
    append(Determiner, Noun, Nounphrase).

english(Nounphrase, [nounphrase, simple, nonnominative], [Type]) :-
    english(Determiner, [determiner, _]),
    english(Noun, [noun, _, unmarked], [Type]),
    append(Determiner, Noun, Nounphrase).

english(Nounphrase, [nounphrase, complex, nominative], [Type]) :-
    english(Determiner, [determiner, _]),
    english(Noun, [noun, _, unmarked], [Type]),
    english(PrepPhrase, [prepphrase]),
    append([Determiner, Noun, PrepPhrase], Nounphrase).

english(Nounphrase, [nounphrase, complex, nonnominative], [Type]) :-
    english(Determiner, [determiner, _]),
    english(Noun, [noun, _, unmarked], [Type]),
    english(PrepPhrase, [prepphrase]),
    append([Determiner, Noun, PrepPhrase], Nounphrase).

english(Verbphrase, [verbphrase, intransitive, nonperception]) :-
    english(Verbphrase, [verb, intransitive, _]).

english(Verbphrase, [verbphrase, transitive, nonperception]) :-
    english(Verb, [verb, transitive, Type]),
    not(Type = perception),
    english(Nounphrase, [nounphrase, _, nonnominative], [entity]),
    append(Verb, Nounphrase, Verbphrase).

english(Verbphrase, [verbphrase, transitive, perception]) :-
    english(CompPhrase, [compphrase]),
    english(Verb, [verb, transitive, perception]),
    append(Verb, CompPhrase, Verbphrase). 

english(PrepPhrase, [prepphrase]) :-
    english(Preposition, [preposition], [Type]),
    english(Nounphrase, [nounphrase, simple, _], [Type]),
    append(Preposition, Nounphrase, PrepPhrase).

english(CompPhrase, [compphrase]) :-
    english(Complementizer, [complementizer]),
    english(Sentence, [sentence, simple]),
    append(Complementizer, Sentence, CompPhrase).

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

/* english(Form, Type, [conjoined]) :-
    append([FormLeft, [and], FormRight], Form),
    english(FormLeft, Type, _),
    english(FormRight, Type, _),
    not(FormLeft = [she]),
    not(FormLeft = [he]),
    not(FormLeft = [him]),
    not(FormLeft = [her]),
    not(FormRight = [she]),
    not(FormRight = [he]),
    not(FormRight = [him]),
    not(FormRight = [her]). */

english(Form, Type, [conjoined]) :-
    english(FormLeft, Type),
    english(FormRight, Type),
    Type = [Head|_],
    not(Head = determiner),
    not(Head = complementizer),
    not(Head = compphrase),
    append([FormLeft, [and], FormRight], Form).