app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)) :- app(X1s,Ys,X2s).
add(o,Y,Y).
add(s(X),Y,s(R)). :- add(X,Y,R).
natSymb(o).
natSymb(s(X)) :- natSymb(X).

%linListe(Xs)
linListe(nil).
linListe(list(X,Xs)).

%member(X,Ys) : Ys enthält das Element X.
prakmember(nil,nil).
prakmember(X,Ys) :- linListe(list(X,Ys)), app(nil,X,Ys).

%infix(Xs,Ys) : Ys enthält die Liste Xs.
infix(nil,nil).
infix(Xs,Ys) :- linListe(list(X,Ys)), app(nil,Xs,Ys).






%n(X,Lb,Rb).
binbaum(nil).
binbaum(n(X,Lb,Rb)) :- binbaum(Lb), binbaum(Rb).

root(n(W,Lb,Rb),b).
left(n(W,Lb,Rb),Lb).
right(n(W,Lb,Rb),Rb).


%construct(Root,Lb,Rb,Xneub) : Xneub ist der Baum mit
%- Wurzelbeschriftung Root,
%- linkem Teilbaum Lb und
%- rechtem Teilbaum Rb.

construct(nil,nil,nil,nil).
construct(Root,Lb,Rb,n(Root,Lb,Rb)):- binbaum(Lb), binbaum(Rb).

%knotenanz(Xb,N) : N (nat. Zahl in symbolischer Darstellung) ist die Anzahl der Knoten des Baumes Xb.
knotenanz(nil,o).
knotenanz(n(X,Lb,Rb),s(N)) :- knotenanz(Rb,R2), knotenanz(Lb,R1), add(R2,R1,N), natSymb(N).
