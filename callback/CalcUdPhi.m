

argSop1_PLL = (PW + PLL1.Xextr(2)*tint + PLL1.Xextr(1))';
% dopphase = PLL1.Buffer1 + (PLL1.Xextr(1) - PLL1.Xold(1))/T*tint;
% argSop1_PLL = (PW +  dopphase)';
% PLL1.Buffer1 = dopphase(end) + (PLL1.Xextr(1) - PLL1.Xold(1))/T*Td;
Sop1cos_PLL = cos(argSop1_PLL);
Sop1sin_PLL = sin(argSop1_PLL);
I1_PLL = y1 * Sop1cos_PLL;
Q1_PLL = y1 * Sop1sin_PLL;
ud_PLL1 = -atan(Q1_PLL/I1_PLL);

argSop2_PLL = (PW +  PLL2.Xextr(2)*tint + PLL2.Xextr(1))';
% dopphase = PLL2.Buffer1 + (PLL2.Xextr(1) - PLL2.Xold(1))/T*tint;
% argSop2_PLL = (PW +  dopphase)';
% PLL2.Buffer1 = dopphase(end) + (PLL2.Xextr(1) - PLL2.Xold(1))/T*Td;
Sop2cos_PLL = cos(argSop2_PLL);
Sop2sin_PLL = sin(argSop2_PLL);
I2_PLL = y2 * Sop2cos_PLL;
Q2_PLL = y2 * Sop2sin_PLL;
ud_PLL2 = -atan(Q2_PLL/I2_PLL);



