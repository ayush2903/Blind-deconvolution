function a = AlphaStar(z,L,Bt,A)
    a = 0;
    if((L^0.5)*norm(Bt,inf) < 2*(a^0.5))
        for i = 1:L
            a = a + z(i)*(Bt(:,i)*A(i,:));
        end
    end
end