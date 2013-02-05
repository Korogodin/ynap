
if ZeroPsiOp
    argSop2 = (PW)';
else
    argSop2 = (PW + Kalm.Xextr(2)*tint)';
end
% argSop2 = (PW)';
Sop2cos = cos(argSop2);
Sop2sin = sin(argSop2);
I2 = y2 * Sop2cos;
Q2 = y2 * Sop2sin;
Ic = I1 + cos(Kalm.Xextr(1))*I2 - sin(Kalm.Xextr(1))*Q2;
Qc = Q1 + cos(Kalm.Xextr(1))*Q2 + sin(Kalm.Xextr(1))*I2;

I2h = -y2*(Sop2sin.*((1:L)'-1)*Td);
Q2h = y2*(Sop2cos.*((1:L)'-1)*Td);

I1h = -y1*(Sop1sin.*((1:L)'-1)*Td);
Q1h = y1*(Sop1cos.*((1:L)'-1)*Td);

ud = cos(Kalm.Xextr(1))*(I2*Qc - Ic*Q2) - sin(Kalm.Xextr(1))*(I2*Ic + Q2*Qc);

% ud_corr = cos(Kalm.Xextr(1))*(I2h*Qc - Ic*Q2h) - sin(Kalm.Xextr(1))*(I2h*Ic + Q2h*Qc);
% ud_corr = ud_corr + I2*Q2h - Q2*I2h;
% ud_corr = ud_corr + cos(Kalm.Xextr(1))*(I2*Q1 - I1*Q2) - sin(Kalm.Xextr(1))*(I2*I1 + Q2*Q1);
% ud_corr = ud_corr * Kalm.Xextr(2);

ud_corr5 = cos(Kalm.Xextr(1))*(I2h*Q1 - I1*Q2h) - sin(Kalm.Xextr(1))*(I2h*I1 + Q2h*Q1);
% % ud_corr5 = ud_corr5 + cos(Kalm.Xextr(1))*(I2*Qc - Ic*Q2) - sin(Kalm.Xextr(1))*(I2*Ic + Q2*Qc);
ud_corr5 = ud_corr5 * Kalm.Xextr(2);
% 
% %TEST2
% BigKalm_Ud = zeros(nx, 1);
% BigKalm_Hess = zeros(nx, nx);
% 
% BigKalm_dX = [2*pi/360*0.1; 0.02*pi/360];
% BigKalm_psi1 = (-1:1:1)*BigKalm_dX(1) + Kalm.Xextr(1);
% BigKalm_psi2 = (-1:1:1)*BigKalm_dX(2) + 0;
% cospsi1= cos(BigKalm_psi1);
% sinpsi1= sin(BigKalm_psi1);
% 
% argBessel = zeros(length(BigKalm_psi1), length(BigKalm_psi2));
% for j2 = 1:length(BigKalm_psi2)
%     argSop2 = (PW + BigKalm_psi2(j2)*tint)';
%     Sop2cos = cos(argSop2);
%     Sop2sin = sin(argSop2);
%     I2 = y2 * Sop2cos;
%     Q2 = y2 * Sop2sin;
%     Ic = I1 + cospsi1*I2 - sinpsi1*Q2;
%     Qc = Q1 + cospsi1*Q2 + sinpsi1*I2;
%     argBessel(:, j2) = sqrt( Ic.*Ic + Qc.*Qc );
% end
% argBessel = A*argBessel*invstdn2;
% BigKalm_lnL = argBessel - 0.5*log(argBessel);
% 
% 
% BigKalm_Ud(1) = (BigKalm_lnL(3,2) - BigKalm_lnL(1,2)) / (2*BigKalm_dX(1));
% BigKalm_Ud(2) = (BigKalm_lnL(2,3) - BigKalm_lnL(2,1)) / (2*BigKalm_dX(2));
% 
% BigKalm_Hess(1,1) = ( (BigKalm_lnL(3,2) - BigKalm_lnL(2,2)) / BigKalm_dX(1) - (BigKalm_lnL(2,2) - BigKalm_lnL(1,2)) / BigKalm_dX(1) ) / BigKalm_dX(1);
% BigKalm_Hess(2,2) = ( (BigKalm_lnL(2,3) - BigKalm_lnL(2,2)) / BigKalm_dX(2) - (BigKalm_lnL(2,2) - BigKalm_lnL(2,1)) / BigKalm_dX(2) ) / BigKalm_dX(2);
% 
% firstdiff = zeros(2,1); 
% firstdiff(1) = (BigKalm_lnL(3,1) - BigKalm_lnL(1,1)) / (2*BigKalm_dX(1));
% firstdiff(2) = (BigKalm_lnL(3,3) - BigKalm_lnL(1,3)) / (2*BigKalm_dX(1));
% BigKalm_Hess(1,2) = (firstdiff(2) - firstdiff(1)) / (2*BigKalm_dX(2));
% BigKalm_Hess(2,1) = BigKalm_Hess(1,2);
% %TEST2 END
% 
%TEST
% argSop2 = (PW + Kalm.Xextr(2)*tint)';
% % argSop2 = (PW)';
% Sop2cos = cos(argSop2);
% Sop2sin = sin(argSop2);
% I2 = y2 * Sop2cos;
% Q2 = y2 * Sop2sin;
% Ic = I1 + cos(Kalm.Xextr(1))*I2 - sin(Kalm.Xextr(1))*Q2;
% Qc = Q1 + cos(Kalm.Xextr(1))*Q2 + sin(Kalm.Xextr(1))*I2;
% ud_test = cos(Kalm.Xextr(1))*(I2*Qc - Ic*Q2) - sin(Kalm.Xextr(1))*(I2*Ic + Q2*Qc);
% 
% argSop2 = (PW + BigKalm_psi2(3)*tint)';
% Sop2cos = cos(argSop2);
% Sop2sin = sin(argSop2);
% I2 = y2 * Sop2cos;
% Q2 = y2 * Sop2sin;
% ud_test3 = cos(Kalm.Xextr(1))*(I2*Q1 - I1*Q2) - sin(Kalm.Xextr(1))*(I2*I1 + Q2*Q1);
% 
% argSop2 = (PW + BigKalm_psi2(2)*tint)';
% Sop2cos = cos(argSop2);
% Sop2sin = sin(argSop2);
% I2 = y2 * Sop2cos;
% Q2 = y2 * Sop2sin;
% ud_test2 = cos(Kalm.Xextr(1))*(I2*Q1 - I1*Q2) - sin(Kalm.Xextr(1))*(I2*I1 + Q2*Q1);
% 
% argSop2 = (PW + BigKalm_psi2(1)*tint)';
% Sop2cos = cos(argSop2);
% Sop2sin = sin(argSop2);
% I2 = y2 * Sop2cos;
% Q2 = y2 * Sop2sin;
% ud_test1 = cos(Kalm.Xextr(1))*(I2*Q1 - I1*Q2) - sin(Kalm.Xextr(1))*(I2*I1 + Q2*Q1);
%TEST END
% 
% % ud_test
% % ud
% % BigKalm_Ud
% % Hess = BigKalm_Hess * ud / BigKalm_Ud(1);
% ud_corr;
% ud_corr2 = BigKalm_Hess(1,1) * Kalm.Xextr(2) / 18;
% ud_corr2_2 = BigKalm_Hess(1,1) * Kalm.Xextr(2) / 5.608;
% ud_corr3 = ud_test - ud;
% ud_corr4 = (ud_test3 - ud_test1) / (2*BigKalm_dX(2)) * Kalm.Xextr(2);
% ud_corr5;
ud = ud + ud_corr5;

% KRes.ud(k) = ud;
% KRes.ErrX1(k) = Kalm.Xextr(1) - Xs(1);

ud = ud / Sd_psi;
