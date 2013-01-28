    Xs = F*Xs + G*randn(1,1)*sqrt(Dksi);
%     if k < 20
%         Xs(1) = 0;
%         Xs(2) = 0;
%     else
%         Xs(1) = pi/2;
%         Xs(2) = 0;
%     end    
%     cfreq =  40/360;
%     phi_Xs = 2*pi*cfreq*k*T;
%     Amp = 5 * 2*pi;
%     Xs(1) = Amp*cos(phi_Xs) - Amp;
%     Xs(2) = -Amp*sin(phi_Xs)*2*pi*cfreq;
    TrueValues.psi1(k) = Xs(1);
    TrueValues.psi2(k) = Xs(2);
    
    phi0 =  rand(1,1)*2*pi;
    S2 = A*cos(Xs(1) + Xs(2)*tint +phi0 + PW);
    S1 = A*cos(phi0 + PW);
    y2 = S2 + 1*stdn*randn(1,L);
    y1 = S1 + 1*stdn*randn(1,L);