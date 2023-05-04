% Computes linear elastic tensor C in Voigt form

function C = Elastic(k,mu)

C = zeros(6,6);

c1 = k + 4*mu/3;
c2 = k - 2*mu/3;
c3 = mu;

C(1,1) = c1;
C(2,2) = c1;
C(3,3) = c1;

C(1,2) = c2; 
C(1,3) = c2;
C(2,1) = c2;
C(2,3) = c2;
C(3,1) = c2;
C(3,2) = c2;

C(4,4) = c3;
C(5,5) = c3;
C(6,6) = c3;