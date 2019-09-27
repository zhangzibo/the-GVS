:- ['entailment.pl'].

vow(P) :- name(P,[121]). 		/** y is a vowel **/
vow(P) :- name(P,[248]). 		/** o/ is a vowel **/
vow(P) :- name(P,[230]). 		/** ae is a vowel **/
vow(P) :- name(P,[105]). 		/** i is a vowel **/
vow(P) :- name(P,[101]). 		/** e is a vowel **/
vow(P) :- name(P,[117]). 		/** u is a vowel **/
vow(P) :- name(P,[111]). 		/** o is a vowel **/
vow(P) :- name(P,[097]). 		/** a is a vowel **/

per(P) :- name(P,[121]). 		/** y is peripheral **/
per(P) :- name(P,[248]). 		/** o/ is peripheral **/
per(P) :- name(P,[230]). 		/** ae is peripheral **/
per(P) :- name(P,[117]). 		/** u is peripheral **/
per(P) :- name(P,[111]). 		/** o is peripheral **/
per(P) :- name(P,[097]). 		/** a is peripheral **/

bck(P) :- name(P,[117]). 		/** u is back **/
bck(P) :- name(P,[111]). 		/** o is back **/
bck(P) :- name(P,[097]). 		/** a is back **/

hih(P) :- name(P,[121]).		/** y is high **/
hih(P) :- name(P,[105]). 		/** i is high **/
hih(P) :- name(P,[117]). 		/** u is high **/

low(P) :- name(P,[230]).		/** ae is low **/
low(P) :- name(P,[097]).		/** a is low **/

% nonce word
/* underfinnish([b,V1,b,V2]) :-
    (vow(V1), vow(V2)). */

% house
underfinnish([t,a,l,V], [root]) :-
    per(V), not(hih(V)), not(low(V)).

% village
underfinnish([k,y,l,V], [root]) :-
    per(V), low(V).

% suffix "in the"
underfinnish([s,s,V], [suffix]) :-
    per(V), low(V).

underfinnish(Form, [stem]) :-
    underfinnish(Root, [root]),
    underfinnish(Suffix, [suffix]),
    append(Root, Suffix, Form).

% surface forms
finnish(Form, [stem]) :-
    underfinnish(Form, [stem]),
    (per(A), per(B), member(A, Form), member(B, Form)) => (bck(A) <=> bck(B)).