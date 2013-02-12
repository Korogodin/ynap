function start_JS_Test( MW )

globals;


qcno_dB = 45;

JS = [33:0.5:36 38.5:0.5:42.5];

le_JS = length(JS);
Dksi = 0.01;

Erro.JS = JS;
Erro.MeanErrPhi_ArgMax = nan(1, le_JS);
Erro.MeanErrPhi_Mean = nan(1, le_JS);
Erro.MeanErrPhi_Kalm = nan(1, le_JS);
Erro.MeanErrPhi_BigKalm = nan(1, le_JS);
Erro.MeanErrPhi_Res2PLL = nan(1, le_JS);

for n = 1:1000
    for i = 1:le_JS

        erro = process(MW, qcno_dB, Dksi, JS(i));
        if erro 
            return;
        end
      
    end
    save_statistic_JS;
end



end

