function RMS = CalcRMS( X1, X2, Y1, Y2, T, L, K )
X1 = X1/2 / pi;
X2 = X2 / 2/ pi;
Y1 = Y1/2 / pi;
Y2 = Y2 / 2/ pi;
Td = T/L;

E1 = Y1 - X1;
E2 = Y2 - X2;

Err_k = zeros(1,K);
for k = 1:K
    Err_k(k) = sum(( E1(k) + E2(k)*((1:L)-1)*Td ).^2);
end
Err_k = Err_k / L;

Err = sqrt(sum(Err_k) / K);
Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;

RMS = Err;


end


