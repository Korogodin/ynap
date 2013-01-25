function process(MW)
%PROCESS Start time!

globals;

Fd = 44.2e6 * 1e-3; %MHz
Td = 1/Fd;

stdn = 8e-2;
dstdn2 = 2*stdn^2;
invdstdn2 = 1/2*stdn^2;


global TrueValues

T = 0.02; Cm.T = T;
% F = [1 T 0;
%        0 1 T;
%        0 0 1];
F = [1 T;
    0 1];
G = [0; 1];
nx = 2;

% Sksi = 1e-3;
Sksi = 1e-0;
Dksi = Sksi/T;
Dxx = Dksi; %G'*Dksi*G;
detDxx = det(Dxx);
Dxxm1 = Dxx^-1;
Da = Dksi * (1/T) * (1/(2*pi*1.6e9)*3e8)^2; % D[a], (m/s^2)^2

K = 200;
L = round(T/Td);
M = 2;

qcno_dB = 20;
qcno = 10.^(qcno_dB/10);
A = 2*stdn*sqrt(qcno*Td);
invstdn2 = 1/stdn^2;

lbase = 2; lambda0 = 0.19;

% Initial state

% Initial PD of PhD
% H_psi1 = 2 * lbase/lambda0 * 2*pi;
H_psi1 = 2*pi;
D_extr_psi1 = (H_psi1^2)/12;
psi1s = (rand(1,1) - 0.5)*H_psi1; % psi_0

% Initial PD of PhD rate
H_psi2 = 2*pi*lbase/lambda0 / 3 ;
D_extr_psi2 = (H_psi2^2)/12;
psi2s = (rand(1,1) - 0.5)*H_psi2; % (diff psi)_0

% Initial PD of rate of PhD rate
H_psi3 = 6*sqrt(12 * Dksi);
D_extr_psi3 = (H_psi3^2)/12;
psi3s = (rand(1,1) - 0.5)*H_psi3; % (diff diff psi)_0

Xs = [psi1s; psi2s];

Npsi = [80; 20; 1]; % Number of points by axes
maxpsi = 4*[sqrt(D_extr_psi1); sqrt(D_extr_psi2); sqrt(D_extr_psi3)]; % Argument's area
minpsi = -maxpsi;
dpsi = (maxpsi-minpsi) ./ Npsi; % differential step
psi1 = minpsi(1):dpsi(1):maxpsi(1); % Argument's vectors
psi2 = minpsi(2):dpsi(2):maxpsi(2);
% psi3 = minpsi(3):dpsi(3):maxpsi(3);

ST.psi1_p = psi1/2/pi;
ST.psi2_p = psi2/2/pi;

pest_psi1 = 1/H_psi1 .* ( (psi1 >= (-H_psi1/2))&(psi1 <= (H_psi1/2)) ); % Initial PDs
pest_psi2 = 1/H_psi2 .* ( (psi2 >= (-H_psi2/2))&(psi2 <= (H_psi2/2)) );
% pest_psi3 = 1/H_psi3 .* ( (psi3 >= (-H_psi3/2))&(psi3 <= (H_psi3/2)) );

pest = pest_psi1'*pest_psi2; % Common PD
ST.pest0 = pest;

Strat = CStrat(T, Dxx, minpsi(1:2), maxpsi(1:2), dpsi(1:2), pest);

global StratResults
StratResults = CStratResults(K, 2, T);
StratResults.setP0(minpsi(1:2), maxpsi(1:2), dpsi(1:2), pest);
if qcno_dB > 30
    StratResults.setLogMode(1);
else
    StratResults.setLogMode(0);
end

TrueValues.K = K;
TrueValues.T = T;
TrueValues.t = (1:K)*T;
TrueValues.psi1 = nan(1,K);
TrueValues.psi2 = nan(1,K);

tint = (0:(L-1))*Td;
PW = 2*pi*Fd/3.3712*tint; % Intermediate freq phase
argSop1 = PW';
Sop1cos = cos(argSop1);
Sop1sin = sin(argSop1);
    
global h_timer
t_start = tic;
% Cycles
matlabpool size;
size_m = ans;
if ~((ans == 8)||(ans == 4))
    try
        matlabpool close;
    end
    matlabpool;
end
for k = 1:K
    
    tin = tic;
    Strat.Extrapolate();
    psi1 = Strat.Xextr{1};
    psi2 = Strat.Xextr{2};
    ST.psi1_p_extr = psi1/ 2 / pi ;
    ST.psi2_p_extr = psi2/ 2 / pi ;
    
    toutExtr = toc(tin);
   
    Xs = F*Xs + G*randn(1,1)*sqrt(Dksi);
%     cfreq = 0.3;
%     phi_Xs = 2*pi*cfreq*k*T;
%     Amp = 8*pi;
%     Xs(1) = Amp*cos(phi_Xs) - Amp;
%     Xs(2) = -Amp*sin(phi_Xs)*2*pi*cfreq;
    TrueValues.psi1(k) = Xs(1);
    TrueValues.psi2(k) = Xs(2);
    
    phi0 =  rand(1,1)*2*pi;
    S2 = A*cos(Xs(1) + Xs(2)*tint +phi0 + PW);
    S1 = A*cos(phi0 + PW);
    y2 = S2 + 1*stdn*randn(1,L);
    y1 = S1 + 1*stdn*randn(1,L);

    I1 = y1 * Sop1cos;
    Q1 = y1 * Sop1sin;
    
    cospsi1= cos(psi1);
    sinpsi1= sin(psi1);
    
    argBessel = zeros(length(psi1), length(psi2));
    
    parfor j2 = 1:length(psi2)
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
    
    tln = toc(tin);
    
    Strat.Observe(lnL);
    StratResults.setLnL(lnL);
    StratResults.takeResults(Strat);
    
    try 
        MW.replot();
        tout = toc(tin);
        tfromstart = toc(t_start);
        set(h_timer, 'String', num2str(tfromstart));
    catch err
        if strcmp(err.identifier, 'MATLAB:class:InvalidHandle')
            disp('Form is closed');
            return
        else
            rethrow(err);
        end
    end

end

end

