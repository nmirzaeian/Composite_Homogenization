% Computes localization tensor P in Voigt form

function P = Localization(r1,r2,r3,k,mu,nu,k0,mu0)

C0 = Elastic(k0,mu0);
C = Elastic(k,mu);
T = Eshelby(r1,r2,r3,nu);
I = eye(6);

B = T*inv(C0)*(C-C0)+I;
P = inv(B);