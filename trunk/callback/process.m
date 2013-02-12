function erro = process(MW, qcno_dB, Dksi, JS)
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

K = 2000;
L = round(T/Td);
M = 2;

% qcno_dB = 40;
qcno = 10.^(qcno_dB/10);
A = 2*stdn*sqrt(qcno*Td);

if JS_Test 
    stdJ = sqrt(A^2/2 * 10^(JS/10) /2e6 * 44.2e6/2 *  Fd/2 / (44.2e6/2));
else
    stdJ = 0;
end

initial_PD_script;
Strat = CStrat(T, Dksi, minpsi(1:2), maxpsi(1:2), dpsi(1:2), pest);
Construct_StratResults;
Construct_TrueValues;
Construct_Kalman;
Construct_BigKalm;
Construct_2PLL;

tint = (0:(L-1))*Td;
PW = 2*pi*Fd/3.3712*tint; % Intermediate freq phase
argSop1 = PW';
Sop1cos = cos(argSop1);
Sop1sin = sin(argSop1);
    
global h_timer
t_start = tic;
% Construct_Matlabpool;
for k = 1:K
    
    if DoStrat
        Strat.Extrapolate();
    end
    
    if DoKalm
        Kalm.Extrapolate();
    end
    
    if Do2PLL
        PLL1.Extrapolate();
        PLL2.Extrapolate();
    end
    
    if DoBigKalm
        BigKalmXbase = BigKalm.Extrapolate();
        if ZeroPsiOp
            BigKalmXbase(2) = 0;
        end
        BigKalm.setBase(BigKalmXbase);
    end
    
    EvalTrueProcess;
    
    I1 = y1 * Sop1cos;
    Q1 = y1 * Sop1sin;
    
    if DoStrat
        CalcLnL;
        Strat.Observe(lnL);
        StratResults.setLnL(lnL);
        StratResults.takeResults(Strat);
    end
    
    if DoKalm
        if UseCorrHess && ZeroPsiOp
            CalcUdwithCorrection;
        else
            CalcUd;
        end
        Kalm.Estimate(ud);
        mX = Kalm.getXest();
        KRes.X{1}(k) = mX(1);
        KRes.X{2}(k) = mX(2);
        KRes.Band = Kalm.Band;
    end
    
    if DoBigKalm
        CalcUdHess;
        BigKalm.Estimate(BigKalm_Ud, BigKalm_Hess);
        mX = BigKalm.getXest();
        BigKRes.X{1}(k) = mX(1);
        BigKRes.X{2}(k) = mX(2);
    end
    
    if Do2PLL
        CalcUdPhi;
        PLL1.Estimate(ud_PLL1);
        PLL2.Estimate(ud_PLL2);
        mX1 = PLL1.getXest();
        mX2 = PLL2.getXest();
        Res2PLL.X{1}(k) = mX2(1) - mX1(1);
        Res2PLL.X{2}(k) = mX2(2) - mX1(2);
    end
    
    ReplotGraphs;
    if retu
        erro = 1;
        return
    end
end

if JS_Test
    [nul i] = min(abs(Erro.JS - JS));
else
    [nul i] = min(abs(Erro.qcno_dB - qcno_dB));
end
if nul == 0
    
        if DoStrat
            Erro.MeanErrPhi_ArgMax(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, StratResults.ArgMax{1}, StratResults.ArgMax{2}, T, L, K );
            Erro.MeanErrPhi_Mean(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, StratResults.Mean{1}, StratResults.Mean{2}, T, L, K );
        end
        
        if DoKalm
            if (ZeroPsiOp == 1)&&(UseCorrHess == 0)
                Erro.MeanErrPhi_Kalm(i) = CalcRMS_mean( TrueValues.psi1, TrueValues.psi2, KRes.X{1}, KRes.X{2}, T, L, K );
            else
                Erro.MeanErrPhi_Kalm(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, KRes.X{1}, KRes.X{2}, T, L, K );
            end
            Erro.KalmBand(i) = KRes.Band;
        end

        if DoBigKalm
            Erro.MeanErrPhi_BigKalm(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, BigKRes.X{1}, BigKRes.X{2}, T, L, K );
        end
        
        if Do2PLL
            Erro.MeanErrPhi_Res2PLL(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, Res2PLL.X{1}, Res2PLL.X{2}, T, L, K );
        end
    
else
    disp('qcno error in process save');
    error;
end
    

end

