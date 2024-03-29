lbase = 2; lambda0 = 0.19;

% Initial state
dpsi = nan(2,1);
% Initial PD of PhD
% H_psi1 = 2 * lbase/lambda0 * 2*pi;
if qcno_dB > 20
    dpsi(1) = 2*pi/360 / (qcno_dB/40);
else
    dpsi(1) = 2*pi/ 120;
end
dpsi(1) = 2*pi/360;

% dpsi(1) = 2*pi/500;
% H_psi1 = 30*dpsi(1) ;
H_psi1 = 5*dpsi(1) ;
D_extr_psi1 = (H_psi1^2)/12;
psi1s = (rand(1,1) - 0.5)*H_psi1 * 0; % psi_0

% Initial PD of PhD rate
% H_psi2 = 2*pi*lbase/lambda0 / 3 ;
if qcno_dB > 20
    H_psi2 = sqrt(12*Dksi)  / (qcno_dB/40);
else
    H_psi2 = sqrt(12*Dksi) * 1.5;
end
% if Dksi<0.1
%     H_psi2 = H_psi2 * 2;
% end
D_extr_psi2 = (H_psi2^2)/12;
psi2s = (rand(1,1) - 0.5)*H_psi2 *0; % (diff psi)_0  

Xs = [psi1s; psi2s]; % = 0 -> for Kalm and Strat equi
% Xs = [pi/4; 0];

Npsi2 = 16; % Number of points by axes
% Npsi2 = 24; % Number of points by axes
% Npsi2 = 32; % Number of points by axes
% if Dksi<0.1
%     Npsi2 = Npsi2 * 2;
% end
maxpsi = [2*H_psi1/2; 4*sqrt(D_extr_psi2)]; % Argument's area
minpsi = -maxpsi;
dpsi(2) = (maxpsi(2)-minpsi(2)) ./ Npsi2; % differential step
psi1 = minpsi(1):dpsi(1):maxpsi(1); % Argument's vectors
psi2 = minpsi(2):dpsi(2):maxpsi(2);
% psi3 = minpsi(3):dpsi(3):maxpsi(3);

pest_psi1 = 1/H_psi1 .* ( (psi1 >= (-H_psi1/2))&(psi1 <= (H_psi1/2)) ); % Initial PDs
pest_psi2 = 1/H_psi2 .* ( (psi2 >= (-H_psi2/2))&(psi2 <= (H_psi2/2)) );
% pest_psi3 = 1/H_psi3 .* ( (psi3 >= (-H_psi3/2))&(psi3 <= (H_psi3/2)) );

pest = pest_psi1'*pest_psi2; % Common PD