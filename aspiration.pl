:- ['fulldisplay.pl'].

/* aspiration.pl
LIN 177
Done in class 8/13

This program is a model of a fragment of the aspiration
phenomenon of English (a voiceless stop becomes aspirated
when it occurs as the first phone of a word).

If an underlying form (e.g. Tap, "top" or "thap", indicated by
underenglish/2) passes through by rule to a surface form
(those indicated by english/2), it will have undergone the
rules of aspiration and the underspecified voiceless stop
will be either aspirated or unaspirated based on its position
in the word. */

% additions to properties for aspirated phones
% phones
phone(th).
phone(ph).
phone(kh).

% consonantal
cns(th).
cns(ph).
cns(kh).

% aspirated
asp(th).
asp(ph).
asp(kh).

% places of articulation
alv(th).
lab(ph).
vel(kh).


% Lexicon
%top
underenglish([P1,P2,P3], [word]) :-                     % underlying form
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)),     % t or th
        not(sib(P1)), alv(P1),
    phone(P2), not(cns(P2)), bck(P2), low(P2),          % a
    phone(P3), cns(P3), not(cnt(P3)), not(voi(P3)),     % p
        not(sib(P3)), lab(P3), not(asp(P3)).

%stop
underenglish([s,P2,P3,P4], [word]) :-                   % underlying form
    phone(P2), cns(P2), not(cnt(P2)), not(voi(P2)),     % t or th
        not(sib(P2)), alv(P2),
    phone(P3), not(cns(P3)), bck(P3), low(P3),          % a
    phone(P4), cns(P4), not(cnt(P4)), not(voi(P4)),     % p
        not(sib(P4)), lab(P4), not(asp(P4)).

%pat
underenglish([P1,ae,t], [word]) :-                      % underlying form
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)),     % p or ph
        not(sib(P1)), lab(P1).

%spat
underenglish([s,P2,ae,t], [word]) :-                    % underlying form
    phone(P2), cns(P2), not(cnt(P2)), not(voi(P2)),     % p or ph
        not(sib(P2)), lab(P2).

%cop
underenglish([P1,a,p], [word]) :-                       % underlying form
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)),     % k or kh
        not(sib(P1)), vel(P1).

% Rules of aspiration
english(Word, [word]) :-                                % surface form                    
    phone(Phone), cns(Phone), not(cnt(Phone)),          % Phone is among [p,ph,t,th,k,kh]
        not(voi(Phone)), not(sib(Phone)),
    Word = [Phone|_],                                   % Phone is the head of Word
    underenglish(Word, [word]),                         % underlying form exists
    asp(Phone).                                         % Phone is aspirated

english(Word, [word]) :-                                % surface form
    underenglish(Word, [word]),                         % underlying form exists
    Word = [Phone|Tail],                                % Phone is head of Word; Tail is tail
    Tail = [SecondPhone|_],                             % head of Tail is SecondPhone
    phone(SecondPhone), cns(SecondPhone),               % SecondPhone is among [p,ph,t,th,k,kh]
        not(cnt(SecondPhone)), not(voi(SecondPhone)),
        not(sib(SecondPhone)),
    not(asp(SecondPhone)).                              % SecondPhone is not aspirated
                                                        % (thus among [p,t,k])


% Everything below is from phone.pl or properties.pl
% Consonants
cns(A):- name(A,[112]).
cns(A):- name(A,[098]).
cns(A):- name(A,[109]).
cns(A):- name(A,[116]).
cns(A):- name(A,[100]).
cns(A):- name(A,[110]).
cns(A):- name(A,[107]).
cns(A):- name(A,[103]).
cns(A):- name(A,[331]).
cns(A):- name(A,[102]).
cns(A):- name(A,[118]).
cns(A):- name(A,[952]).
cns(A):- name(A,[240]).
cns(A):- name(A,[115]).
cns(A):- name(A,[122]).
cns(A):- name(A,[643]).
cns(A):- name(A,[658]).
cns(A):- name(A,[269]).
cns(A):- name(A,[496]).
cns(A):- name(A,[108]).
cns(A):- name(A,[633]).
cns(A):- name(A,[106]).
cns(A):- name(A,[119]).
cns(A):- name(A,[104]).

% Sonorant
snt(A):- name(A,[109]).
snt(A):- name(A,[110]).
snt(A):- name(A,[331]).
snt(A):- name(A,[108]).
snt(A):- name(A,[633]).
snt(A):- name(A,[106]).
snt(A):- name(A,[119]).
snt(A):- name(A,[105]).
snt(A):- name(A,[618]).
snt(A):- name(A,[101]).
snt(A):- name(A,[230]).
snt(A):- name(A,[117]).
snt(A):- name(A,[650]).
snt(A):- name(A,[111]).
snt(A):- name(A,[097]).
snt(A):- name(A,[601]).
snt(A):- name(A,[652]).

% Nasal
nas(A):- name(A,[109]).
nas(A):- name(A,[110]).
nas(A):- name(A,[331]).

% Voiced
voi(A):- name(A,[098]).
voi(A):- name(A,[109]).
voi(A):- name(A,[100]).
voi(A):- name(A,[110]).
voi(A):- name(A,[103]).
voi(A):- name(A,[331]).
voi(A):- name(A,[118]).
voi(A):- name(A,[240]).
voi(A):- name(A,[122]).
voi(A):- name(A,[658]).
voi(A):- name(A,[496]).
voi(A):- name(A,[108]).
voi(A):- name(A,[633]).
voi(A):- name(A,[106]).
voi(A):- name(A,[119]).
voi(A):- name(A,[105]).
voi(A):- name(A,[618]).
voi(A):- name(A,[101]).
voi(A):- name(A,[230]).
voi(A):- name(A,[117]).
voi(A):- name(A,[650]).
voi(A):- name(A,[111]).
voi(A):- name(A,[097]).
voi(A):- name(A,[601]).
voi(A):- name(A,[652]).

% Continuant
cnt(A):- name(A,[102]).
cnt(A):- name(A,[118]).
cnt(A):- name(A,[952]).
cnt(A):- name(A,[240]).
cnt(A):- name(A,[115]).
cnt(A):- name(A,[122]).
cnt(A):- name(A,[643]).
cnt(A):- name(A,[658]).
cnt(A):- name(A,[108]).
cnt(A):- name(A,[633]).
cnt(A):- name(A,[106]).
cnt(A):- name(A,[119]).
cnt(A):- name(A,[104]).
cnt(A):- name(A,[105]).
cnt(A):- name(A,[618]).
cnt(A):- name(A,[101]).
cnt(A):- name(A,[230]).
cnt(A):- name(A,[117]).
cnt(A):- name(A,[650]).
cnt(A):- name(A,[111]).
cnt(A):- name(A,[097]).
cnt(A):- name(A,[601]).
cnt(A):- name(A,[652]).

% Labial
lab(A):- name(A,[112]).
lab(A):- name(A,[098]).
lab(A):- name(A,[109]).
lab(A):- name(A,[102]).
lab(A):- name(A,[118]).
lab(A):- name(A,[119]).

% Alveolar
alv(A):- name(A,[116]).
alv(A):- name(A,[100]).
alv(A):- name(A,[110]).
alv(A):- name(A,[115]).
alv(A):- name(A,[122]).
alv(A):- name(A,[108]).
alv(A):- name(A,[633]).

% Palatal
pal(A):- name(A,[643]).
pal(A):- name(A,[658]).
pal(A):- name(A,[269]).
pal(A):- name(A,[496]).
pal(A):- name(A,[633]).
pal(A):- name(A,[106]).
 
% Anterior
ant(A):- name(A,[112]).
ant(A):- name(A,[098]).
ant(A):- name(A,[109]).
ant(A):- name(A,[116]).
ant(A):- name(A,[100]).
ant(A):- name(A,[110]).
ant(A):- name(A,[102]).
ant(A):- name(A,[118]).
ant(A):- name(A,[952]).
ant(A):- name(A,[240]).
ant(A):- name(A,[115]).
ant(A):- name(A,[122]).
ant(A):- name(A,[108]).
ant(A):- name(A,[633]).

% Velar
vel(A):- name(A,[107]).
vel(A):- name(A,[103]).
vel(A):- name(A,[331]).
vel(A):- name(A,[119]).

% Coronal
cor(A):- name(A,[116]).
cor(A):- name(A,[100]).
cor(A):- name(A,[110]).
cor(A):- name(A,[952]).
cor(A):- name(A,[240]).
cor(A):- name(A,[115]).
cor(A):- name(A,[122]).
cor(A):- name(A,[643]).
cor(A):- name(A,[658]).
cor(A):- name(A,[269]).
cor(A):- name(A,[496]).
cor(A):- name(A,[108]).
cor(A):- name(A,[633]).
cor(A):- name(A,[106]).

% Sibilant
sib(A):- name(A,[115]).
sib(A):- name(A,[122]).
sib(A):- name(A,[643]).
sib(A):- name(A,[658]).
sib(A):- name(A,[269]).
sib(A):- name(A,[496]).

% High
hih(A):- name(A,[105]).
hih(A):- name(A,[618]).
hih(A):- name(A,[117]).
hih(A):- name(A,[650]).

% Mid (high-low)
mid(A):- name(A,[101]).
mid(A):- name(A,[111]).
mid(A):- name(A,[601]).
mid(A):- name(A,[652]).

% Low
low(A):- name(A,[230]).
low(A):- name(A,[097]).

% Back
bck(A):- name(A,[117]).
bck(A):- name(A,[650]).
bck(A):- name(A,[111]).
bck(A):- name(A,[097]).

% Central (front-back)
ctr(A):- name(A,[601]).
ctr(A):- name(A,[652]).

% Tense
tns(A):- name(A,[105]).
tns(A):- name(A,[117]).

% Stressed
str(A):- name(A,[105]).
str(A):- name(A,[618]).
str(A):- name(A,[101]).
str(A):- name(A,[230]).
str(A):- name(A,[117]).
str(A):- name(A,[650]).
str(A):- name(A,[111]).
str(A):- name(A,[097]).
str(A):- name(A,[652]).


phone(A):-
	name(A,[112]).

phone(A):-
	name(A,[098]).

phone(A):-
	name(A,[109]).

phone(A):-
	name(A,[116]).

phone(A):-
	name(A,[100]).

phone(A):-
	name(A,[110]).

phone(A):-
	name(A,[107]).

phone(A):-
	name(A,[103]).

phone(A):-
	name(A,[331]).

phone(A):-
	name(A,[102]).

phone(A):-
	name(A,[118]).

phone(A):-
	name(A,[952]).
 
phone(A):-
	name(A,[240]).
 
phone(A):-
	name(A,[115]).

phone(A):-
	name(A,[122]).

phone(A):-
	name(A,[643]).

phone(A):-
	name(A,[658]).
 
phone(A):-
	name(A,[269]).

phone(A):-
	name(A,[496]).

phone(A):-
	name(A,[108]).

phone(A):-
	name(A,[633]).

phone(A):-
	name(A,[106]).

phone(A):-
	name(A,[119]).

phone(A):-
	name(A,[104]).

phone(A):-
	name(A,[105]).

phone(A):-
	name(A,[618]).

phone(A):-
	name(A,[101]).

phone(A):-
	name(A,[230]).

phone(A):-
	name(A,[117]).

phone(A):-
	name(A,[650]).
 
phone(A):-
	name(A,[111]).

phone(A):-
	name(A,[097]).
 
phone(A):-
	name(A,[601]).

phone(A):-
	name(A,[652]).
