
% Beispiel zum Entwurf eines Beobachters
n=3,                        % Systemordnung

A=[-1 1 0; 0 -2 1; 0 0 -5], % Systemmatrix
b=[0;0;5/8],                % Eingangsvektor
cT=[1 0 0],

Qb=[cT;cT*A;cT*A*A],        % Beobachtbarkeitsmatrix
% System beobachtbar?
rank(Qb),
det(Qb),

Qbinv=inv(Qb),              % inverse Beobachtbarkeitsmatrix

t1=Qbinv(:,n),              % letzte Spalte von Qb^(-1)

% Ähnlichkeitstransformationsmatrix in Beobachtungsnormalform
TB=[t1 A*t1 A*A*t1],

% Überprüfung der Transformation in Beobachtungsnormalform
AB=inv(TB)*A*TB,
a0=-AB(1,n),
a1=-AB(2,n),
a2=-AB(3,n),

CBT=cT*TB,

% Polvorgabe für den Beobachter
lambda = -6, % Vorgabe: -3 {-6}

% Berechnung des Sollpolynoms
psoll=poly([lambda lambda lambda]),

% Koeffizienten des Sollpolynoms
p0=psoll(n+1),
p1=psoll(n),
p2=psoll(n-1),

% Berechnung des Beobachters in Beobachtungsnormalform
hB1 = p0-a0,
hB2 = p1-a1,
hB3 = p2-a2,

hB = [hB1;hB2;hB3],

% Rücktransformation des Beobachters in das ursprüngliche System
h=TB*hB,

% Auswahl des Eingangssignals
a=0; % 1: Sprung, 0: Sinus


% Simulation in Simulink durchführen!
input('Fortsetzen nach der Simulation in Simulink: Taste ...','s');

% Darstellung der Simulationsergebnisse
load x1.mat;
load x1hat.mat;
load x2.mat;
load x2hat.mat;
load x3.mat;
load x3hat.mat;


figure;
plot(x1(1,:),x1(2,:),'g',x1hat(1,:),x1hat(2,:),'r');
grid on; zoom on;
xlabel('time [s]');
ylabel('Zustandsvariable x_1');
legend('x_1','x_1dach');

figure;
plot(x1(1,:),x1(2,:)-x1hat(2,:),'g');
grid on; zoom on;
xlabel('time [s]');
ylabel('Schätzfehler e_x_1');

figure;
plot(x2(1,:),x2(2,:)-x2hat(2,:),'g');
grid on; zoom on;
xlabel('time [s]');
ylabel('Schätzfehler e_x_2');

figure;
plot(x3(1,:),x3(2,:)-x3hat(2,:),'g');
grid on; zoom on;
xlabel('time [s]');
ylabel('Schätzfehler e_x_3');


