%"1. there is a number in the very beginning"
%"2. the L in language is capitalized"
%"3. it does not have a period"
%"4. it does not have a period, also the variable is capitalized"
%"5. the 2 should not be in the front, since it is a number"
%"6. there should be a connective between uralo and altaic,"



speaks(jane, arabic).
speaks(jane, nahuatl).
speaks(jane, urdu).
speaks(jane, tlingit).

speaks(frank, hawaiian).
speaks(frank, english).

speaks(david,   english).
speaks(david,   spanish).

speaks(zhang,  english).
speaks(zhang,  french).
speaks(zhang,  korean).
speaks(zhang,  chinese).

quadrilingual(Person) :-
    speaks(Person, Lang1),
    speaks(Person, Lang2),
    speaks(Person, Lang3),
    speaks(Person, Lang4),

    not(Lang1 = Lang2),
    not(Lang2 = Lang3),
	not(Lang3 = Lang4),
	not(Lang4 = Lang1),
	not(Lang2 = Lang4).

