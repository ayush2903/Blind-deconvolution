function gh = delGh(B,Bt,u,L,Mu,d)
gh = ( (df(norm(u)^2/(2*d)))*u + L*(sum(u,L,B,Bt,d,Mu))/(4*Mu*Mu) ) / (2*d);
end

function r = sum(u,L,B,Bt,d,Mu)
r = 0;
for i= 1:L
    r = r + df(L*(abs(B(i,:)*u)^2)/(8*d*Mu*Mu)) * B(i,:)*Bt(:,i)*u;
end
end