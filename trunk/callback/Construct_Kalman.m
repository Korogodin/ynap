Sd_psi = (A*L/2)^2 * (M - 1);
q = qcno*T;
Dmeas = 1 / (M - 1) / q * (1 + (M-2)/2 + 1 / 2 / q);
Smeas = Dmeas * T;
Sksi = Dksi / T;

% Sksi = 3e1; % Sksi* (1/T) = Dksi
% Dxx = G*Dksi*G';

if KalmOrder == 2
    Kalm = CKalmanEqMesConstK(Xs, F, T);
elseif KalmOrder == 3
    Fkalm = [1 T 0; 0 1 T; 0 0 1];
    Kalm = CKalmanEqMesConstK([Xs(1); Xs(2); 0], Fkalm);
end

DKest = [0.5 0; 0 5];
for j1 = 1:30
    DKest_new(1,1) = Dmeas * (DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2) ./ (Dmeas + DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2);
    DKest_new(2,1) = Dmeas * (DKest(2,1) + DKest(2,2)*T) ./  (Dmeas + DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2);
    DKest_new(1,2) = DKest(2,1);
    DKest_new(2,2) = (Dmeas*(DKest(2,2) + Dksi) + (DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2)*(DKest(2,2) + Dksi) - (DKest(2,1) + DKest(2,2)*T)^2) ./  (Dmeas + DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2);
    DKest = DKest_new;
end
Kalm.setKoeff([DKest(1,1); DKest(2,1)] / Dmeas);
% Kalm.setKoeffFromSpectr(Sksi, Smeas);
Kalm.calcBand();
        
global KRes
KRes.ud = zeros(1, K);
KRes.X = cell(1, nx);
KRes.X{1} = nan(1, K);
KRes.X{2} = nan(1, K);
KRes.ErrX1 = zeros(1, K);
