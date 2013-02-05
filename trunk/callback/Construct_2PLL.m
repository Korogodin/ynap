% Sd_psi = (A*L/2)^2 * (M - 1);
% q = qcno*T;
% Dmeas = 1 / (M - 1) / q * (1 + (M-2)/2 + 1 / 2 / q);
% Smeas = Dmeas * T;
% Sksi = Dksi / T;

% Sksi = 3e1; % Sksi* (1/T) = Dksi
% Dxx = G*Dksi*G';

if KalmOrder == 2
    PLL1 = CKalmanEqMesConstK(Xs*0, F, T);
    PLL2 = CKalmanEqMesConstK(Xs, F, T);
elseif KalmOrder == 3
    Fkalm = [1 T 0; 0 1 T; 0 0 1];
    PLL1 = CKalmanEqMesConstK([Xs(1); Xs(2); 0]*0, Fkalm);
    PLL2 = CKalmanEqMesConstK([Xs(1); Xs(2); 0], Fkalm);
end

Band = 16.5; % for digital system is 20 Hz
setKoeffFromBand(PLL1, Band)
setKoeffFromBand(PLL2, Band)
        
global Res2PLL
Res2PLL.X = cell(1, nx);
Res2PLL.X{1} = nan(1, K);
Res2PLL.X{2} = nan(1, K);


