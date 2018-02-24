function [c,ceq] = cond(z,L,B,d,Mu)
c = (L^0.5)*norm(B*z,inf) - 2*(d^0.5)*Mu;
ceq = [];
end