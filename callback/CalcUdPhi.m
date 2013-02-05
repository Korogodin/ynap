
argSop1_PLL = (PW + PLL1.Xextr(2)*tint + PLL1.Xextr(1))';
Sop1cos_PLL = cos(argSop1_PLL);
Sop1sin_PLL = sin(argSop1_PLL);
I1_PLL = y1 * Sop1cos_PLL;
Q1_PLL = y1 * Sop1sin_PLL;
ud_PLL1 = -atan(Q1_PLL/I1_PLL);

argSop2_PLL = (PW + PLL2.Xextr(2)*tint + PLL2.Xextr(1))';
Sop2cos_PLL = cos(argSop2_PLL);
Sop2sin_PLL = sin(argSop2_PLL);
I2_PLL = y2 * Sop2cos_PLL;
Q2_PLL = y2 * Sop2sin_PLL;
ud_PLL2 = -atan(Q2_PLL/I2_PLL);


