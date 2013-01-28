function erro = process(MW, qcno_dB, Sksi)
%PROCESS Start time!
erro = 0;

globals;

Fd = 44.2e6 * 1e-3; %MHz
Td = 1/Fd;

stdn = 8e-2;
invstdn2 = (1/stdn)^2;

T = 0.02;
F = [1 T;
       0 1];
G = [0; 1];
nx = 2;

% Sksi = 3e1; % Sksi* (1/T) = Dksi
Dksi = Sksi*T; 
% Sksi = Dksi / T;
Dxx = Dksi; % G*Dksi*G';
Sksi = Sksi / 10; % Почему то так лучше работает на высоких с/ш

K = 200;
L = round(T/Td);
M = 2;

% qcno_dB = 40;
qcno = 10.^(qcno_dB/10);
A = 2*stdn*sqrt(qcno*Td);

initial_PD_script;
Strat = CStrat(T, Dxx, minpsi(1:2), maxpsi(1:2), dpsi(1:2), pest);
Construct_StratResults;
Construct_TrueValues;
Construct_Kalman;
Construct_BigKalm;

tint = (0:(L-1))*Td;
PW = 2*pi*Fd/3.3712*tint; % Intermediate freq phase
argSop1 = PW';
Sop1cos = cos(argSop1);
Sop1sin = sin(argSop1);
    
global h_timer
t_start = tic;
% Construct_Matlabpool;
for k = 1:K
    
%     Strat.Extrapolate();
    Kalm.Extrapolate();
%     BigKalmXbase = BigKalm.Extrapolate();
%     BigKalmXbase(2) = 0;
    EvalTrueProcess;
    
%     BigKalmXbase = Xs;
%     BigKalm.Xextr = Xs;

%     BigKalm.setBase(BigKalmXbase);
    
    I1 = y1 * Sop1cos;
    Q1 = y1 * Sop1sin;
    
%     CalcLnL;
    
%     Strat.Observe(lnL);
%     StratResults.setLnL(lnL);
%     StratResults.takeResults(Strat);
    
    CalcUd;
    Kalm.Estimate(ud);
    mX = Kalm.getXest();
    KRes.X{1}(k) = mX(1);
    KRes.X{2}(k) = mX(2);
    KRes.Band = Kalm.Band;
    
%     CalcUdHess;
%     BigKalm.Estimate(BigKalm_Ud, BigKalm_Hess);
%     mX = BigKalm.getXest();
%     BigKRes.X{1}(k) = mX(1);
%     BigKRes.X{2}(k) = mX(2);
    
    ReplotGraphs;
    if retu
        erro = 1;
        return
    end
end

end

