

%dieser PDA erkennt Palindrome über {0,1}
%spezieller Teil (für jede Grammatik anders):
%sigma ist das alphabet
sigma(0).
sigma(1).
zustand(z). %zustandsmenge
start(z). %startzustandsmenge
sigma_keller(0).
sigma_keller(1).
sigma_keller(vS).
kellerboden(vS). %kellerbodensybmol

% regeln für jedes synbol aus sigma
% diese funktion ist immer gleich es werden nur die symbole geändert
delta(z,0,0,z,[]).
delta(z,1,1,z,[]).

% delta(zustand_alt,eingabezeichen,kellerzeichen,zustand_neu,liste + kelleralt)
% hier werden einfach die vS-> a vS b regeln abgebildet
delta(z,nix,vS,z,[]).
delta(z,nix,vS,z,[0]).
delta(z,nix,vS,z,[1]).
delta(z,nix,vS,z,[0,vS,0]).
delta(z,nix,vS,z,[1,vS,1]).



%allgemeiner Teil:
% sigma_stern(Xs) : Prüft, ob das Wort in Sigma* enthalten ist
% geht die Liste schrittweise durch und prüft jedes mal, ob der aktuelle
% Buchstabe in sigma enthalten ist
% s. letztes tutoriaum
sigma_stern([]).
sigma_stern([X|Xs]) :- sigma_stern(Xs),  sigma(X).

% Einzelschrittrelation
es(Salt,Ealt, [K|Kalt],Sneu,Ealt,Kneu) :- delta(Salt,nix,K,Sneu,Kzwischen), append(Kzwischen,Kalt,Kneu).
es(Salt,[E|Eneu], [K|Kneu],Sneu,Eneu,Kneu) :- delta(Salt,E,K,Sneu,Kzwischen), append(Kzwischen,Kalt,Kneu).

es_plus(Salt, Ealt, Kalt, Sziel, Eziel, Kziel) :- es(Salt, Ealt, Kalt, Sziel, Eziel, Kziel).
es_plus(Salt, Ealt, Kalt, Sziel, Eziel, Kziel) :- es(Salt, Ealt, Kalt, Szwischen, Ezwischen, Kzwischen),
                                                  es_plus(Szwischen, Ezwischen, Kzwischen, Sziel, Eziel, Kziel).

%lvonM chekct ob Ws im wort ist
lvonM(Ws) :- es_plus(Start,Ws,[Boden],_,[],[]), sigma_stern(Ws), start(Start),kellerboden(Boden).


%TEST IS IN lvonM([0,0,1,1,1,0,0]).
%TEST IS NOT IN lvonM([1,1,0,0,1]).
