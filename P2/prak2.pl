
app(nil,Ys,Ys).
app(list(X,Y),A,list(X,S)) :- app(Y,A,S).

%add(nil,nil,nil).
%add(o,Y,Y).
%add(s(X),Y,s(R)). :- add(X,Y,R).


% A)
linListe(nil).
linListe(list(X,Xs)) :- linListe(Xs).
% B 1)
member(nil,nil).
member(X,list(X,Ys)).
member(X,list(Y,Ys)) :- member(X,Ys), X \= Y.


praefix(nil, Ys).
praefix(list(X,Xs),list(X,Ys)) :- praefix(Xs,Ys).

%B 2)
infix(Infix,Liste) :-app(_,Infix,R), app(R,_,Liste).


tree(nil).
tree(value,X,Y).

binbaum(nil).
binbaum(tree(V,X,Y)) :- binnbaum(X), binbaum(Y).

%construct(Root,Lb,Rb,Xneub) : Xneub ist der Baum mit
%- baum wurzel root Root,
%- linkem Teilbaum Lb und
%- rechtem Teilbaum Rb.
% 2 B)
%leere liste kann nicht construct werden
construct(nil,nil,nil,nil).
%werte in den root einfügen zusammenfügen
construct(Root,Lb,Rb,tree(Root,Lb,Rb)):- binbaum(Lb), binbaum(Rb).


add(X,o,X).
add(X,s(Y),R) :- add(s(X), Y, R).

% 2 A)
%knotenanz(Xb,N) : N (nat. Zahl in symbolischer Darstellung) ist die Anzahl der Knoten des Baumes Xb.
knotenanz(nil,0).
knotenanz(tree(V,Lb,Rb),N) :- knotenanz(Lb,Cl), knotenanz(Rb,Cr), N is 1 + Cl + Cr.



%rev(Xs,Ys).
%leeres liste ist auch leer
rev(nil,nil).
% das was man vorne gerausgenommen hat hinten wieder einfügen
rev(list(X,Xs),Ys) :- rev(Xs,Rs), app(Rs,list(X,nil),Ys).
