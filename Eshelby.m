% Computes Eshelby Tensor T in Voigt form

function T = Eshelby(r1,r2,r3,nu)

alpha = 1 - 2*nu;
beta = 8*pi*(1-nu);

I = FirstElliptic(r1,r2,r3);
II = SecondElliptic(r1,r2,r3);

T = zeros(6,6);

T(1,1) = (3*r1^2*II(1,1)+alpha*I(1))/beta;
T(1,2) = (r2^2*II(1,2)-alpha*I(1))/beta;
T(1,3) = (r3^2*II(1,3)-alpha*I(1))/beta;

T(2,1) = (r1^2*II(2,1)-alpha*I(2))/beta;
T(2,2) = (3*r2^2*II(2,2)+alpha*I(2))/beta;
T(2,3) = (r3^2*II(2,3)-alpha*I(2))/beta;

T(3,1) = (r1^2*II(3,1)-alpha*I(3))/beta;
T(3,2) = (r2^2*II(3,2)-alpha*I(3))/beta;
T(3,3) = (3*r3^2*II(3,3)+alpha*I(3))/beta;

T(4,4) = ((r2^2+r3^2)*II(2,3)+alpha*(I(2)+I(3)))/(beta);
T(5,5) = ((r1^2+r3^2)*II(1,3)+alpha*(I(1)+I(3)))/(beta);
T(6,6) = ((r1^2+r2^2)*II(1,2)+alpha*(I(1)+I(2)))/(beta);