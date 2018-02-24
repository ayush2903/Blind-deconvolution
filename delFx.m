function fx = delFx(u,v,L,A,B,At,Bt,Y)
fx = (AlphaStar(Alpha(u*v',L,B,At)-Y,L,Bt,A)')*u;
end