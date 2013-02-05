
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

ud = cos(Kalm.Xextr(1))*(I2*Qc - Ic*Q2) - sin(Kalm.Xextr(1))*(I2*Ic + Q2*Qc);

KRes.ud(k) = ud;
KRes.ErrX1(k) = Kalm.Xextr(1) - Xs(1);

ud = ud / Sd_psi;

% ud = Xs(1) - Kalm.Xextr(1);
