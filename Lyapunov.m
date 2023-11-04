% Manjul Regmi

function SDotv = Lyapunov(t,Sv,A,Q)
    S = [Sv(1) Sv(2); Sv(2) Sv(3)];
    SDot = A'*S+S*A+Q;
    SDotv = [SDot(1,1); SDot(1,2); SDot(2,2)];
end