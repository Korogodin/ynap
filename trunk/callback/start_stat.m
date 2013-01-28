function start_stat( MW )

globals;

% qcno_dB = [25, 24.5, 24, 23.5, 23, 22.5, 22, 21.5, 21, 20.5, 20, 19.5, 19, 18, 17, 16, 15, 14, 13];
qcno_dB = 50:-1:14;
le_qcno_dB = length(qcno_dB);
Sksi = 3e1;

Erro.qcno_dB = qcno_dB;
Erro.MeanErrPhi_ArgMax = nan(1, le_qcno_dB);
Erro.MeanErrPhi_Mean = nan(1, le_qcno_dB);
Erro.MeanErrPhi_Kalm = nan(1, le_qcno_dB);
Erro.MeanErrPhi_BigKalm = nan(1, le_qcno_dB);

for n = 1:1000
    for i = 1:le_qcno_dB
        erro = process(MW, qcno_dB(i), Sksi);
        if erro 
            return;
        end
        
        Err = (StratResults.ArgMax{1}-TrueValues.psi1)/2/pi;
        Erro.MeanErrPhi_ArgMax(i) = sqrt(Err*Err' / length(Err));
        
        Err = (StratResults.Mean{1}-TrueValues.psi1)/2/pi;
        Erro.MeanErrPhi_Mean(i) = sqrt(Err*Err' / length(Err));
        
        Err = (KRes.X{1}-TrueValues.psi1)/2/pi;
        Erro.MeanErrPhi_Kalm(i) = sqrt(Err*Err' / length(Err));
        Erro.KalmBand(i) = KRes.Band;
        
        Err = (BigKRes.X{1}-TrueValues.psi1)/2/pi;
        Erro.MeanErrPhi_BigKalm(i) = sqrt(Err*Err' / length(Err));        
        
    end
    save_statistic;
end



end

