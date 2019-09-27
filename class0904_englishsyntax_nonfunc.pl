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
english([bites], [verb, transitive]).

  % sleeps
english([sleeps], [verb, intransitive]).

  % in
english([in], [preposition], [location]).

english(Nounphrase, [nounphrase, simple, nominative], [Type]) :-
    english(Noun, [noun, _, nominative], [Type]).

english(Nounphrase, [nounphrase, simple, nonnominative], [Type]) :-
    english(Noun, [noun, _, nonnominative], [Type]).

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

english(Verbphrase, [verbphrase, intransitive]) :-
    english(Verbphrase, [verb, intransitive]).

english(Verbphrase, [verbphrase, transitive]) :-
    english(Verb, [verb, transitive]),
    english(Nounphrase, [nounphrase, _, nonnominative], [entity]),
    append(Verb, Nounphrase, Verbphrase).

english(PrepPhrase, [prepphrase]) :-
    english(Preposition, [preposition], [Type]),
    english(Nounphrase, [nounphrase, simple, _], [Type]),
    english(Pronoun1, [noun, singular, nominative]),
    english(Pronoun2, [noun, singular, nonnominative]),
    not(Nounphrase = Pronoun1),
    not(Nounphrase = Pronoun2),
    append(Preposition, Nounphrase, PrepPhrase).

english(Sentence, [sentence]) :-
    english(Nounphrase, [nounphrase, _, nominative], [entity]),
    english(Verbphrase, [verbphrase, _]),
    append(Nounphrase, Verbphrase, Sentence).