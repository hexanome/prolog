#!/usr/bin/swipl

lol:-write(hahaha).

element(X,[X|L],L).
element(X,[LH|LT],[RH|RT]):-element(X,LT,RT),member(RH,[LH|LT]),not(member(X,[RH|RT])), not(member(RH,RT)).

extract(L,E):-element(X,L,E),member(X,E).

concat([],L,L).
concat([H|LB],A,[H|RB]):-concat(LB,A,RB).

inverse([],[]).
inverse([LH|LB],I):-inverse(LB,R),concat(R,[LH],I).

rang(0,X,[X|_]).
rang(N,X,[_|LB]) :- var(N),rang(M,X,LB),N is M+1.
rang(N,X,[_|LB]) :- nonvar(N),M is N-1,rang(M,X,LB).

:-op(1000,xfy,'before').
[H1|_] before [H2|_]:-H1<H2.
[H1|B1] before [H2|B2]:-concat([H1|B1],_,[H2|B2]);B1 before B2.

avant([H1|_],[H2|_]):-H1<H2.
avant([H1|B1],[H2|B2]):-concat([H1|B1],_,[H2|B2]);avant(B1,B2). 
