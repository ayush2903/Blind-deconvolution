function b = Alpha(z,L,B,At)
    b = zeros(L,1);
    if((L^0.5)*norm(B,inf) < 2*((b'*b)^0.5))
        for i = 1:L
            b(i) = b(i) + (B(i,:)*z*At(:,i));
        end
    end
end
