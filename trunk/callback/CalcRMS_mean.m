function RMS = CalcRMS_mean( X1, X2, Y1, Y2, T, L, K )
X1 = X1/2 / pi;
X2 = X2 / 2/ pi;
Y1 = Y1/2 / pi;
Y2 = Y2 / 2/ pi;
Td = T/L;

Err_k = zeros(1,K);

L1 = fix(L/2); L2 = L - L1;

Y1km1 = Y1(1);
for k = 1:K
    y1 = (Y1(k) + Y1km1)/2 + (Y1(k) - Y1km1)/T * ((1:L1)-1)*Td;
    y2 = Y1(k) + Y2(k) * ((1:L2)-1)*Td;
    x1 = X1(k) + X2(k)*((1:L1)-1)*Td;
    x2 = x1(end) + X2(k)*(1:L2)*Td;
    Err_k(k) = sum( ( y1 - x1 ).^2 ) + sum( ( y2 - x2 ).^2 );
    Y1km1 = Y1(k);
    % figure(12); plot(1:L1, x1, 1:L1, y1, L1 + (1:L2), x2, L1 + (1:L2), y2)
end
Err_k = Err_k / L;

Err = sqrt(sum(Err_k) / K);
Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;

RMS = Err;

end


