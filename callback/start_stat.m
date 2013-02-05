function start_stat( MW )

globals;

% qcno_dB = [50 45 40 35 30 29 27 25 24 23 22 21 20.5 20 19.5 19 18.5 18];
% qcno_dB = [50 45 40 35 30 29 27 25 24 23 22 21 20 19 18 17 16 15 14.5 14 13.5 13 12.5 12 11.5 11];
qcno_dB = [24 23.5 23 22.5 22 21.5 21 20.5 20 19.5 19];
% qcno_dB = 50:-1:25;
% qcno_dB = 45;

le_qcno_dB = length(qcno_dB);
Dksi = 0.6;

Erro.qcno_dB = qcno_dB;
Erro.MeanErrPhi_ArgMax = nan(1, le_qcno_dB);
Erro.MeanErrPhi_Mean = nan(1, le_qcno_dB);
Erro.MeanErrPhi_Kalm = nan(1, le_qcno_dB);
Erro.MeanErrPhi_BigKalm = nan(1, le_qcno_dB);
Erro.MeanErrPhi_Res2PLL = nan(1, le_qcno_dB);

for n = 1:1000
    for i = 1:le_qcno_dB

        JS = 0;
        erro = process(MW, qcno_dB(i), Dksi, JS);
        if erro 
            return;
        end
        
        Err = (StratResults.ArgMax{1}-TrueValues.psi1)/2/pi;
        Err = sqrt(Err*Err' / length(Err));
        Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;
        Erro.MeanErrPhi_ArgMax(i) = Err;
        
        Err = (StratResults.Mean{1}-TrueValues.psi1)/2/pi;
        Err = sqrt(Err*Err' / length(Err));
        Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;
        Erro.MeanErrPhi_Mean(i) = Err;
        
%         Err = (KRes.X{1}-TrueValues.psi1)/2/pi;
%         Err = sqrt(Err*Err' / length(Err));
%         Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;
%         Erro.MeanErrPhi_Kalm(i) = Err;
        
        
        if DoKalm
            Erro.KalmBand(i) = KRes.Band;
        end
        
        Err = (BigKRes.X{1}-TrueValues.psi1)/2/pi;
        Err = sqrt(Err*Err' / length(Err));
        Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;
        Erro.MeanErrPhi_BigKalm(i) = Err;     
        
        Err = (Res2PLL.X{1}-TrueValues.psi1)/2/pi;
        Err = sqrt(Err*Err' / length(Err));
        Err = (Err > 1)*1 + (abs(Err) <= 1)*Err;
        Erro.MeanErrPhi_Res2PLL(i) = Err;            
    end
%     save_statistic;
end



end


