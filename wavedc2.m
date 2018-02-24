function [C,s] = wavedc2(I,a,Blurred,c)
INITPSF = ones(size(a));
[~, P] = deconvblind(Blurred,INITPSF,30);
WEIGHT = edge(I,'sobel',.28);
se1 = strel('disk',1);
se2 = strel('line',13,45);
WEIGHT = ~imdilate(WEIGHT,[se1 se2]);
WEIGHT = padarray(WEIGHT(2:end-1,2:end-1),[1 1]);
P1 = P;
P1(P1 < 0.01)= 0;
[C, s] = deconvblind(Blurred,P1,50,[],double(WEIGHT));
end