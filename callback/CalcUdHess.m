BigKalm_Ud = zeros(nx, 1);
BigKalm_Hess = zeros(nx, nx);

BigKalm_dX = [2*pi/360*4; 2*pi/360];
BigKalm_psi1 = (-1:1:1)*BigKalm_dX(1) + BigKalmXbase(1);
BigKalm_psi2 = (-1:1:1)*BigKalm_dX(2) + BigKalmXbase(2);
cospsi1= cos(BigKalm_psi1);
sinpsi1= sin(BigKalm_psi1);

argBessel = zeros(length(BigKalm_psi1), length(BigKalm_psi2));
for j2 = 1:length(BigKalm_psi2)
    argSop2 = (PW + BigKalm_psi2(j2)*tint)';
    Sop2cos = cos(argSop2);
    Sop2sin = sin(argSop2);
    I2 = y2 * Sop2cos;
    Q2 = y2 * Sop2sin;
    Ic = I1 + cospsi1*I2 - sinpsi1*Q2;
    Qc = Q1 + cospsi1*Q2 + sinpsi1*I2;
    argBessel(:, j2) = sqrt( Ic.*Ic + Qc.*Qc );
end
argBessel = A*argBessel*invstdn2;
BigKalm_lnL = argBessel - 0.5*log(argBessel);

ud = cos(BigKalm.Xextr(1))*(I2*Qc(2) - Ic(2)*Q2) - sin(BigKalm.Xextr(1))*(I2*Ic(2) + Q2*Qc(2));
ud = ud / Sd_psi;
BigKalm_Ud(1) = ud / Dmeas;
% BigKalm_Ud(1) = (BigKalm_lnL(3,2) - BigKalm_lnL(1,2)) / (2*BigKalm_dX(1));
% BigKalm_Ud(2) = (BigKalm_lnL(2,3) - BigKalm_lnL(2,1)) / (2*BigKalm_dX(2));
BigKalm_Ud(2) = 0;

BigKalm_Hess(1,1) = ( (BigKalm_lnL(3,2) - BigKalm_lnL(2,2)) / BigKalm_dX(1) - (BigKalm_lnL(2,2) - BigKalm_lnL(1,2)) / BigKalm_dX(1) ) / BigKalm_dX(1);
BigKalm_Hess(2,2) = ( (BigKalm_lnL(2,3) - BigKalm_lnL(2,2)) / BigKalm_dX(2) - (BigKalm_lnL(2,2) - BigKalm_lnL(2,1)) / BigKalm_dX(2) ) / BigKalm_dX(2);

first_diff = zeros(2,1); 
firstdiff(1) = (BigKalm_lnL(3,1) - BigKalm_lnL(1,1)) / (2*BigKalm_dX(1));
firstdiff(2) = (BigKalm_lnL(3,3) - BigKalm_lnL(1,3)) / (2*BigKalm_dX(1));
BigKalm_Hess(1,2) = (firstdiff(2) - firstdiff(1)) / (2*BigKalm_dX(2));
BigKalm_Hess(1,2) = BigKalm_Hess(2,1);

BKH = [1 0];
BigKalm_Hess = BKH' * BKH / Dmeas;

BigKRes.ud(k) = BigKalm_Ud(1);
BigKRes.ErrX1(k) = Xs(1) - BigKalmXbase(1);