Sd_psi = (A*L/2)^2 * (M - 1);
q = qcno*T;
Dmeas = 1 / (M - 1) / q * (1 + (M-2)/2 + 1 / 2 / q);
Smeas = Dmeas * T;

Fkalm = [1 T 0; 0 1 T; 0 0 1];
Kalm = CKalmanEqMesConstK([Xs(1); Xs(2); 0], Fkalm);
% Kalm = CKalmanEqMesConstK(Xs, F);
Kalm.setKoeffFromSpectr(Sksi, Smeas, T);
Kalm.calcBand();

global KRes
KRes.ud = zeros(1, K);
KRes.X = cell(1, nx);
KRes.X{1} = nan(1, K);
KRes.X{2} = nan(1, K);
KRes.ErrX1 = zeros(1, K);
