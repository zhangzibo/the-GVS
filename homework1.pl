%"excercise1:" 	 	


%"1. both voiced and voiceless bilabial stop and bilabial nasal"
%"2. central mid lax vowel"
%"3. voiceless alveolar fricative, alveolar-palatal fracative, and alveolar-palatal affricate"





% "phone.pl"

phone(p).
phone(t).
phone(k).
phone(i).
phone(u).
phone(ae).
phone(a).
%"properties"
cns(p).
cns(t).
cns(k).

vow(X):-
ph	one(X),not(cns(X)).


%"syllable"

syllable(Syllable) :-
	onset(Onset),
	rime(Rime),
	append(Onset, Rime, Syllable).

rime(Rime) :-
	nucleus(Nucleus),
	coda(Coda),
	append(Nucleus, Coda, Rime).

nucleus([Nucleus]) :-
	vow(Nucleus).

onset([Onset]) :-
	phone(Onset), cns(Onset).

coda([]).
