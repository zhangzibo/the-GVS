:- ["properties.pl"].

english([b,i] ,[modern]).
english([h,a,ʊ,s], [modern]).
english([ʃ,i,p], [modern]).
english([m,i],[modern]).

%be  /bi/
gvs(Form):-
	english([P1, P2], [modern]),
	phone(P1), cns(P1), voi(P1), lab(P1), ant(P1),  %b
	phone(P2), not(cns(P2)), snt(P2), voi(P2), cnt(P2), hih(P2), tns(P2), str(P2),   %i
	phone(X), snt(X), not(hih(X)), not(low(X)), not(bck(X)), voi(X),not(ctr(X)), cnt(X), mid(X), str(X),   %e
	phone(X1), not(cns(X1)), snt(X1), voi(X1), cnt(X1), mid(X1), str(X1),   %I
	append([[P1], [X]], Form).


%house /haʊs/
gvs(Form):-
	english([P1,P2,P3,P4], [modern]),
	phone(P1), cns(P1), not(voi(P1)),cnt(P1), not(lab(P1)), not(alv(P1)), not(snt(P1)),
		not(pal(P1)), not(ant(P1)), not(vel(P1)), not(cor(P1)), not(sib(P1)), %h
	phone(P2), snt(P2), voi(P2), cnt(P2), low(P2), bck(P2), str(P2),  %a
	phone(P3), snt(P3), voi(P3), cnt(P3), hih(P3),bck(P3),str(P3), not(tns(P3)), %ʊ
	phone(P4), cns(P4), not(voi(P4)), cnt(P4),alv(P4), ant(P4), cor(P4), sib(P4), %s
	phone(X), snt(X), voi(X),cnt(X), low(X),str(X), not(bck(X)), %ae
	append([[P1], [X], [P3], [P4]], Form).

%sheep /ʃip/
gvs(Form):-
	english([P1,P2,P3], [modern]),
	phone(P1), cns(P1),not(voi(P1)),cnt(P1),pal(P1),cor(P1),sib(P1), %ʃ
	phone(P2), snt(P2),voi(P2),cnt(P2),hih(P2),tns(P2),str(P2),not(bck(P2)), %i
	phone(P3), cns(P3), not(voi(P3)),ant(P3),lab(P3),not(cnt(P3)),  %p
	phone(X), snt(X), voi(X), cnt(X), hih(X), str(X), not(tns(X)), not(bck(X)), %I
	phone(X1), snt(X1), not(hih(X1)), not(low(X1)), not(bck(X1)), voi(X1),not(ctr(X1)), cnt(X1), mid(X1), str(X1), %e
	append([[P1], [X1], [X], [P3]], Form).

%me /mi/
gvs(Form):-
	english([P1,P2],[modern]),
	phone(P1), cns(P1),snt(P1),nas(P1),voi(P1),lab(P1),ant(P1), not(vel(P1)), %m
	phone(X), snt(X), voi(X), cnt(X), hih(X), str(X), not(tns(X)), not(bck(X)), %I
	phone(X1), snt(X1), not(hih(X1)), not(low(X1)), not(bck(X1)), voi(X1),not(ctr(X1)), cnt(X1), mid(X1), str(X1), %e
	append([[P1],[X1],[X]], Form).

