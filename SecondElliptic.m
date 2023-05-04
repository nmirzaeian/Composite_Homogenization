% Computes second-order elliptic integral I_ij

function II = SecondElliptic(r1,r2,r3)

R = [r1 r2 r3];
II = zeros(3,3);
rho = 2*pi*r1*r2*r3;

G = @(s,v,w) ((v.^2+s).*(w.^2+s).*sqrt((r1^2+s).*(r2^2+s).*(r3^2+s))).^(-1);

for i = 1:3
    for j = 1:3
        II(i,j) = rho*integral(@(s) G(s,R(i),R(j)),0,Inf);
    end
end


