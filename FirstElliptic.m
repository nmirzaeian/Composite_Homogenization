% Computes first-order elliptic integral I_i

function I = FirstElliptic(r1,r2,r3)

R = [r1 r2 r3];
I = zeros(3,0);
rho = 2*pi*r1*r2*r3;

F = @(s,u) ((u.^2+s).*sqrt((r1^2+s).*(r2^2+s).*(r3^2+s))).^(-1);

for i = 1:3
    I(i) = rho*integral(@(s) F(s,R(i)),0,Inf);
end


