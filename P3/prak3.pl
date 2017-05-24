
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
binbaum(t(_,L,R)) :- binbaum(L), binbaum(R).


% Testcase Baum t(a,nil,nil)).
% 2Testcase Baum t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,nil,t(f,t(g,nil,nil),nil)))
%BinBaum Test


%binbaum(nil).
%binbaum(tree(V,X,Y)) :- binnbaum(X), binbaum(Y).


%construct(Root,Lb,Rb,Xneub) : Xneub ist der Baum mit
%- baum wurzel root Root,
%- linkem Teilbaum Lb und
%- rechtem Teilbaum Rb.
% 2 B)
%leer kann nicht constructed werden
%construct(nil,nil,nil,nil).
%werte in den root einfügen zusammenfügen
construct(Root,Lb,Rb,Xb):- Xb= t(Root,Lb,Rb), binbaum(Lb), binbaum(Rb).


add(X,o,X).
add(s(X),Y,s(R)) :- add(X, Y, R).



% 2 A)
%knotenanz(Xb,N) : N (nat. Zahl in symbolischer Darstellung) ist die Anzahl der Knoten des Baumes Xb.
% IS ANZ knotenanz(tree(a,nil,nil),Z).
knotenanz(nil,o).
knotenanz(tree(Root,nil,nil),s(o)).
knotenanz(tree(V,Lb,Rb),s(H)) :- knotenanz(Lb,A), knotenanz(Rb,B),add(A,B,H).



%rev(Xs,Ys).
%leeres liste ist auch leer
rev(nil,nil).
% das was man vorne herausgenommen hat hinten wieder einfügen
% TEST CASE rev(list(a,list(b,list(c,nil))),Zs).
rev(list(X,Xs),Ys) :- rev(Xs,Rs), app(Rs,list(X,nil),Ys).


rbt_count_nodes(t(_,L,R),N):-
    rbt_count_nodes(L,NL),
    rbt_count_nodes(R,NR),
    N=NL+NR+1.

palindrom(nil).
palindrom(Xs):- linListe(Xs) , rev(Xs,Xs).

%t(a,t(b,t(d,nil,nil),t(e,nil,nil)),t(c,t(f,nil,nil),t(g,nil,nil))).
% treemember(X,Xb)    X ist ein member des Baumes Xb
% IS IN TEST : treemember(b,t(a,t(b,nil,nil),t(c,nil,nil))).
% IS NOT IN : treemember(f,t(a,t(b,nil,nil),t(c,nil,nil))).
treemember(X,t(X,Left,Right)).
treemember(X,t(Y,Left,Right)):- treemember(X,Left).
treemember(X,t(Y,Left,Right)):- treemember(X,Right).

% IS IN TEST: postfix(list(a,list(b,nil)), list(b,nil)).
% IS NOT IN : postfix(list(a,list(b,nil)), list(a,nil)).
postfix([],Ys).
postfix(list(X,Xs),Ys):-app(As,Xs,Ys); rev(list(Y,Ys),Xs).
%postfix([X|Xs],Ys):-app(As,Xs,Ys); rev([Y|Ys],Xs).
%postfix(Xs,Ys) :-rev(Ys,Yr), rev(Xs,Xr),praefix(Xr,Yr).
%postfix(Xs,Ys) :- app(_,Xs,Ys).

%praeorder(nil, baum)
% IS IN TEST: praeorder(t(a,t(b,nil,nil),t(c,nil,nil)),[a,b,c]).
% IS NOT IN : praeorder(t(a,t(b,nil,nil),t(c,nil,nil)),[a,c,b]).
praeorder(nil,[]).
praeorder(t(X,Lb,Rb),Xs):- praeorder(Lb,Ls),praeorder(Rb,Rs),append([X|Ls],Rs,Xs).
%postorder
% IS IN TEST: praeorder(t(a,t(b,nil,nil),t(c,nil,nil)),[a,b,c]).
% IS NOT IN : praeorder(t(a,t(b,nil,nil),t(c,nil,nil)),[a,c,b]).
postorder(nil,[]).
postorder(t(X,Lb,Rb),Xs):- postorder(Lb,Ls),postorder(Rb,Rs),append([X|Rs],Ls,Xs).
%roots
% IS IN TEST: roots([t(a,t(b,nil,nil),t(c,nil,nil)),t(f,t(g,nil,nil),t(h,nil,nil))],Zs).
%IS NOT IN : roots([t(a,t(b,nil,nil),t(c,nil,nil)),t(f,t(g,nil,nil),t(h,nil,nil))],[a,g]).
roots([],[]).
roots([t(V,_,_)|Xbs],[V|Vs]) :- roots(Xbs,Vs).
roots([nil|Xbs],Vs) :- roots(Xbs,Vs).
%mirror
%
%IN TEST mirror(t(a,t(b,nil,nil),t(c,nil,nil)),Zs).
mirror(nil,nil).
mirror(t(X,Lb,Rb),t(X,Rbb,Lbb)) :- mirror(Lb,Lbb), mirror(Rb,Rbb).





%
%
%
%
%
