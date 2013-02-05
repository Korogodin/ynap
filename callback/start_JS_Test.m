function start_JS_Test( MW )

globals;


qcno_dB = 45;

JS = [20 23 26 29 32 33 34 35 35.5 36 36.5 37 37.5 38 38.5 39 39.5 40 40.5 41 41.5 42];
le_JS = length(JS);
Dksi = 0.6;

Erro.JS = JS;
Erro.MeanErrPhi_ArgMax = nan(1, le_JS);
Erro.MeanErrPhi_Mean = nan(1, le_JS);
Erro.MeanErrPhi_Kalm = nan(1, le_JS);
Erro.MeanErrPhi_BigKalm = nan(1, le_JS);

for n = 1:1000
    for i = 1:le_JS

        erro = process(MW, qcno_dB, Dksi, JS(i));
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
    save_statistic_JS;
end



end

