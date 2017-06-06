% NEA automatenauswertung für eine sprache
%IS IN TEST vonN([1,1,0,0]).
%IS NOT IN TEST vonN([1,,0,1]).
%4a
%Das Wort muss mindestens ein 11 enthalten
%z ist Zustandsmenge
z(z0).
z(z1).
z(z2).

%sigma alfabet facts
sigma(1).
sigma(0).

%delta regelset P Übergangstabelle
delta(z0,0,z0).
delta(z0,1,z0).
delta(z0,1,z1).
delta(z1,1,z2).
delta(z2,0,z2).
delta(z2,1,z2).

%start ist Startzugangsmenge
q_start(z0).
%end ist Endzustandsmenge
q_end(z2).




% 4b
% signma stern alphabet für jeden buchstaben/fact in sigma
sigma_stern([]).
sigma_stern([X|Xs]) :- sigma(X), sigma_stern(Xs).
%tutorium
delta_stern(Zakt,[X],Zneu) :- delta(Zakt,X,Zneu).
delta_stern(Zakt,[X|Xs],Zneu) :- delta(Zakt,X,Zstep), delta_stern(Zstep,Xs,Zneu).

lvonN([]) :- q_start(Zstart), q_end(Zstart).%Es gibt ein Startpunkt der auch Endpunkt ist
lvonN(Ws) :- q_start(Zstart), q_end(Zend), delta_stern(Zstart,Ws,Zend).
