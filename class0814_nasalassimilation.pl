:- ['properties.pl'].
:- ['entailment.pl']. % => and <=> added

% Lexicon
underenglish([P1, P2], [prefix]) :-     % prefix [IN-]
    phone(P1), not(cns(P1)), hih(P1),   % high front lax vowel
        not(bck(P1)), not(mid(P1)), 
        not(tns(P1)),
    phone(P2), nas(P2).                 % any nasal

underenglish([P1,k,t,i,v], [root]) :-   % active
    phone(P1), not(cns(P1)), not(bck(P1)),
        not(mid(P1)), not(hih(P1)).     % front low vowel

underenglish([P1,a,n,g,r,u,e,n,t], [root]) :- % congruent
    phone(P1), cns(P1), vel(P1), not(voi(P1)).% k

underenglish([P1,a,s,i,b,e,l], [root]) :-   % possible
    phone(P1), cns(P1), lab(P1), not(voi(P1)),  % p
        not(cnt(P1)).

% Morphological rules
homorganic(A, B) :-
    lab(A) <=> lab(B),
    vel(A) <=> vel(B).

% prefixation
english(Stem, [stem]) :-                % surface form
    underenglish(Prefix, [prefix]),     % underlying prefix
    underenglish(Root, [root]),         % underlying root
    Root = [FirstPhoneOfRoot|_],        % get the head of the root
    last(Prefix, LastPhoneOfPrefix),    % get the last element of Prefix
                                        % alternate (not as good):
                                        % Prefix = [_, LastPhoneOfPrefix],
    homorganic(LastPhoneOfPrefix, FirstPhoneOfRoot), % they must be homorganic
    append(Prefix, Root, Stem).         % append the prefix
                                        % to the root to yield
                                        % the stem


% Experimental stuff down here 
/* underenglish(Stem, [stem]) :-
    underenglish(Prefix, [prefix]),
    underenglish(Root, [root]),
    append(Prefix, Root, Stem). */

/* english(Stem, [stem]) :-
    underenglish(Stem, [stem]),
    (nextto(N, C, Stem), nas(N), cns(C)) => 
    homorganic(N, C). */