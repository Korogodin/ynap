    psi1 = Strat.Xextr{1};
    psi2 = Strat.Xextr{2};
    cospsi1= cos(psi1);
    sinpsi1= sin(psi1);
    
    argBessel = zeros(length(psi1), length(psi2));
    for j2 = 1:length(psi2)
        argSop2 = (PW + psi2(j2)*tint)';
        Sop2cos = cos(argSop2);
        Sop2sin = sin(argSop2);
        I2 = y2 * Sop2cos;
        Q2 = y2 * Sop2sin;
        Ic = I1 + cospsi1*I2 - sinpsi1*Q2;
        Qc = Q1 + cospsi1*Q2 + sinpsi1*I2;
        argBessel(:, j2) = sqrt( Ic.*Ic + Qc.*Qc );
    end
    argBessel = A*argBessel*invstdn2;
    lnL = argBessel - 0.5*log(argBessel);  