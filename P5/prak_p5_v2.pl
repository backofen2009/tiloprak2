%z ist Zustandsmenge von PDA
z(z).

%sigma ist Eingabealphabet von PDA
sigma(1).
sigma(0).

%keller ist Kelleralphabet von PDA
keller(0).
keller(1).
keller(z).

%delta ist Transitionsrelation
delta(z,0,0,z,[]).
delta(z,1,1,z,[]).
delta(z,nix,s,z,[]).
delta(z,nix,s,z,[0]).
delta(z,nix,s,z,[1]).
delta(z,nix,s,z,[0,s,0]).
delta(z,nix,s,z,[1,s,1]).

%start ist Anfangszustand
start(z).

%kellerStart ist unterstes Symbol auf dem Keller
kellerStart(s).


%BEARBEITUNG
sigma_stern([]).
sigma_stern([X|Xs]) :- sigma(X), sigma_stern(Xs).

%es(Za,Ia,Ka,Ze,Ie,Ke) Za:=Zustand vor Schritt, Ia:=Input vor Schritt, Ka:=Keller vor Schritt, Ze:=Zustand nach Schirtt, Ie:=Input nach Schritt, Ke:=Keller nach Schritt
es(Za,[Ia|Ias],[Ka|Kas],Ze,Ias,Ke) :- delta(Za,Ia,Ka,Ze,E), append(E,Kas,Ke).
es(Za,Ia,[Ka|Kas],Ze,Ia,Ke) :- delta(Za,nix,Ka,Ze,E), append(E,Kas,Ke).

%es_plus(Za,Ia,Ka,Ze,Ie,Ke)
es_plus(Za,Ia,Ka,Ze,Ie,Ke) :- es(Za,Ia,Ka,Ze,Ie,Ke).
es_plus(Za,Ia,Ka,Ze,Ie,Ke) :- es(Za,Ia,Ka,Zz,Iz,Kz), es_plus(Zz,Iz,Kz,Ze,Ie,Ke).

%Ws ist in Kellerautomat
lvonM(Ws) :-  start(Za), kellerStart(Ka), es_plus(Za,Ws,[Ka],_,[],[]).
