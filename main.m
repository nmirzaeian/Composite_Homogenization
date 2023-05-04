clc
clear all
close all

%% setting up number of discritization points
n = 1000; %number of discitized nodes 

%% cases to be evaluated

%css = 'a';
css = 'b';

geometry = struct; %matrix of radii 
switch css
    case 'a' % cases 1-5
        geometry.c1 = [1 1 1; 1 1 0.01; 1 1 1]; 
        geometry.c2 = [1 1 1; 1 1 100; 1 1 1]; 
        geometry.c3 = [1 1 1; 1 1 1e-8; 1 1 1]; 
        geometry.c4 = [1 1 1; 1 1 1e8; 1 1 1]; 
        geometry.c5 = [1 1 1; 1 1 1; 1 1 1]; 
    case 'b' % cases 6-10
        geometry.c1 = [1 1 1; 1 1 1; 1 1 0.01]; 
        geometry.c2 = [1 1 1; 1 1 1; 1 1 100]; 
        geometry.c3 = [1 1 1; 1 1 1; 1 1 1e-8]; 
        geometry.c4 = [1 1 1; 1 1 1; 1 1 1e8]; 
        geometry.c5 = [1 1 1; 1 1 1; 1 1 1]; 
    otherwise
        disp('Wrong case identifier. Please select either a or b.');
        return
end

names = fieldnames(geometry); 

%% parameters
phi1 = 0.3; % volume fraction of matrix phase
phi2 = linspace(0,0.7,n);
k = [50 100 1];%*(1e6); % array of bulk moduli
mu = [10 20 0.2];%*(1e6); % array of shear moduli
nu = (3*k-2*mu)./(6*k+2*mu); % array of Poisson's ratios 

%% functions used in this script
% I = FirstElliptic(r1,r2,r3); % first-order elliptic integral
% II = SecondElliptic(r1,r2,r3); % second-order elliptic integral
% C = Elastic(k,mu); % linear elastic tensor C
% T = Eshelby(r1,r2,r3,nu); % Eshelby tensor T % Calls FirstElliptic and SecondElliptic
% P = Localization(r1,r2,r3,k,mu,nu,k0,mu0); % Localization tensor P % Calls Eshelby and Elastic

%% computes the Voigt approximation (upper bound) and Reuss approximation (lower bound)
%for effective bulk modulus K and effective shear modulus MU
voK = zeros(n,1);
voMU = zeros(n,1);
reK = zeros(n,1);
reMU = zeros(n,1);
for i = 1:n

    phi = [phi1 phi2(i) 1 - phi1 - phi2(i)];

    voK(i) = phi(1)*k(1) + phi(2)*k(2) + phi(3)*k(3); % effective Voigt bulk modulus
    voMU(i) = phi(1)*mu(1) + phi(2)*mu(2) + phi(3)*mu(3); % effective Voigt bulk modulus

    reK(i) = (phi(1)/k(1) + phi(2)/k(2) + phi(3)/k(3))^(-1); % effective Reuss bulk modulus
    reMU(i) = (phi(1)/mu(1) + phi(2)/mu(2) + phi(3)/mu(3))^(-1); % effective Reuss bulk modulus

end


%% computes effective bulk modulus K and effective shear modulus MU for
%different inclusion geometries
effK = zeros(5,n);
effMU = zeros(5,n);
for c = 1:5

    R = geometry.(names{c});

    PH = [0 0 0];
    PS = [0 0 0];
    for j = 1:3
        P = Localization(R(j,1),R(j,2),R(j,3),k(j),mu(j),nu(j),k(1),mu(1));
        PH(j) = sum(P(1:3,1:3),[1 2])/3;
        PS(j) = (P(1,1)+P(2,2)+P(3,3)+P(4,4)+P(5,5)+P(6,6)-PH(j))/5;
    end


    % wsPH % weighted-sum PH
    % wsPS % weighted-sum PS
    % wsK % weighted-sum bulk modulus k
    % wsMU % weighted-sum shear modulus mu

    for i = 1:n
    
        phi = [phi1 phi2(i) 1 - phi1 - phi2(i)];

        wsPH = phi(1)*PH(1) + phi(2)*PH(2) + phi(3)*PH(3); 
        wsPS = phi(1)*PS(1) + phi(2)*PS(2) + phi(3)*PS(3); 
        wsK = phi(1)*k(1)*PH(1) + phi(2)*k(2)*PH(2) + phi(3)*k(3)*PH(3);
        wsMU = phi(1)*mu(1)*PS(1) + phi(2)*mu(2)*PS(2) + phi(3)*mu(3)*PS(3);
    
        effK(c,i) = wsK/wsPH; % effective bulk modulus Keff
        effMU(c,i) = wsMU/wsPS; % effective shear modulus MUeff 
    
    end

end

%% plotting
pltdata = struct;
pltdata.phi2 = phi2;
pltdata.effK = effK;
pltdata.effMU = effMU;
pltdata.voK = voK;
pltdata.voMU = voMU;
pltdata.reK = reK;
pltdata.reMU = reMU;
pltdata.k = k;
pltdata.mu = mu;

plotfigure(css,pltdata);