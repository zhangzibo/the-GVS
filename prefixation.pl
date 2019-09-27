% Simple English prefixation

english([v,a,n],stem).

english([s,k,i,r,t],stem).

english([g,o,l,f],stem).

english([m,a,x,i],affix).

english([m,i,n,i],affix).


english(A,stem):-
	append(B,C,A),
	english(B,affix),
	english(C,stem).