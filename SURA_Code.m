I = imread('cameraman.png');
p = fspecial('motion',13,45);
Blurred = imfilter(I,p,'symmetric','conv');
[m,n]= size(I);
Y= reshape(I,[m*n,1]);
Y = double(Y);

L = m*n;
K = 10;
N = 20000;
x0,d0 = 1;

F = dftmtx(L);
B = F(:,1:K);
Bt = B';
A = normrnd(0,0.5,L,N) + 1i*normrnd(0,0.5,L,N);
At = A';

Ay = AlphaStar(Y,L,Bt,A);

[C,s]=wavedc2(I,p,Blurred,'haar');
[U,S,V] = svds(Ay,1);
hO = U; 
dO = S;
xO = V;

z0 = zeros(K,1);
Mu = 0.5;
nonlcon = @(z)cond(z,L,B,dO,Mu);
fun = @(z)norm(z-(dO^0.5)*hO)^2;
u = fmincon(fun,z0,[],[],[],[],[],[],nonlcon);
v = (d0^0.5)*x0;

Eta = 0.01;
for t = 1:1000
    ut = u - Eta* ( delFh(u,v,L,A,B,At,Bt,Y) + delGh(B,Bt,u,L,Mu,dO) ); 
    vt = v - Eta* ( delFx(u,v,L,A,B,At,Bt,Y) + delGx(v,dO) );
    u = ut;
    v = vt;
end

g = C*v;
Im = reshape(g,[m,n]);
imwrite(Im,fullfile(folder,'Deblurred.png'));
