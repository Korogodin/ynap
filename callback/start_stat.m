function start_stat( MW )

globals;

% qcno_dB = [50 45 40 35 30 29 28 27 25 24 23 22 21 20.5 20 19.5 19 18.5 18 17.5 17 16.5 16 15.5 15 14.5 14];
% qcno_dB = [50 45 40 35 30 29 27 25 24 23 22 21 20 19 18 17 16 15 14.5 14 13.5 13 12.5 12 11.5 11];
qcno_dB = [24.5:0.5:29.5 30:1:50];


le_qcno_dB = length(qcno_dB);
Dksi = 0.01;

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
        
    end
    save_statistic;
end



end


