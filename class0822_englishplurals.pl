:- ['properties.pl'].
:- ['entailment.pl'].

% English plurals
% map
underenglish([m,ae,P3], [noun, regular, singular], [map]) :-
    phone(P3), lab(P3), not(voi(P3)), not(cnt(P3)).

% lab
underenglish([l,ae,P3], [noun, regular, singular], [lab]) :-
    phone(P3), lab(P3), voi(P3), not(cnt(P3)), not(nas(P3)).

% pass
underenglish([p,ae,P3], [noun, regular, singular], [pass]) :-
    phone(P3), sib(P3), not(voi(P3)), not(pal(P3)).

% ox
underenglish([a,k,s], [noun, irregular, singular], [ox]).
underenglish([a,k,s,e,n], [noun, irregular, plural], [ox]).

% child
underenglish([ch,a,j,l,d], [noun, irregular, singular], [child]).
underenglish([ch,i,l,d,r,e,n], [noun, irregular, plural], [child]).

% productive affix
underenglish([Form], [suffix, regular, plural], [plural]) :-
    phone(Form), sib(Form), not(pal(Form)).

% lexical conditioning
english(Form, Properties, Meaning) :-
    underenglish(Form, Properties, Meaning),
    Properties = [_, irregular, _].

% phonological conditioning
english(Form, Properties, Meaning) :-
    underenglish(Form, Properties, Meaning),
    Properties = [_, regular, singular].

% last phone is sibilant
english(Form, [POS, regular, plural], Meaning) :-
    underenglish(UnderlyingForm, [POS, regular, singular], Meaning),
    underenglish([Suffix], [suffix, regular, plural], [plural]),
    last(UnderlyingForm, LastPhone),
    sib(LastPhone),
    voi(Suffix),
    phone(Vowel), not(cns(Vowel)), not(bck(Vowel)), not(mid(Vowel)),
        hih(Vowel), not(tns(Vowel)),
    append([UnderlyingForm, [Vowel], [Suffix]], Form).

% last phone is nonsibilant
english(Form, [POS, regular, plural], Meaning) :-
    underenglish(UnderlyingForm, [POS, regular, singular], Meaning),
    underenglish([Suffix], [suffix, regular, plural], [plural]),
    last(UnderlyingForm, LastPhone),
    phone(LastPhone), not(sib(LastPhone)),
    homorganic(LastPhone, Suffix),
    append(UnderlyingForm, [Suffix], Form).

homorganic(A, B) :-
    voi(A) <=> voi(B).