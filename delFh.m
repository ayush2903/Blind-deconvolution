function fh = delFh(u,v,L,A,B,At,Bt,Y)
fh = AlphaStar(Alpha(u*v',L,B,At)-Y,L,Bt,A)*v;
end