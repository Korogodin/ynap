    Xs = F*Xs + G*randn(1,1)*sqrt(Dksi);
%     if k < 40
%         Xs(1) = 0;
%         Xs(2) = 0;
%     else
%         Xs(1) = pi/8;
%         Xs(2) = 0;
%     end    
%     cfreq =  360/360;
%     phi_Xs = 2*pi*cfreq*k*T;
%     Amp = 5 * 2*pi;
%     Xs(1) = Amp*cos(phi_Xs) - Amp;
%     Xs(2) = -Amp*sin(phi_Xs)*2*pi*cfreq;
%     Xs(2) = 5;
%     Xs(1) = Xs(1) + Xs(2)*T;
    if JS_Test
        delta_J = pi/4;
        Xs(1) = delta_J;
        Xs(2) = 0;
    end
    TrueValues.psi1(k) = Xs(1);
    TrueValues.psi2(k) = Xs(2);
    
    phi0 =  rand(1,1)*2*pi * 0;
    S2 = A*cos(Xs(1) + Xs(2)*tint +phi0 + PW);
    S1 = A*cos(phi0 + PW);
    noise_yes = 0;
    
    jammer_yes = 1;
    Jamm = stdJ* randn(1,L);
    Jamm = jammer_yes*Jamm;
    y2 = S2 + noise_yes*stdn*randn(1,L) + Jamm; 
    y1 = S1 + noise_yes*stdn*randn(1,L)  + Jamm;