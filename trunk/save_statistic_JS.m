% load('Stat_JS.mat', 'StatFile_JS');

% StatFile_JS.JS = 1:0.5:50;
% StatFile_JS.len_JS = length(StatFile_JS.JS);
% 
% StatFile_JS.NArgMax = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.NMean = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.NKalm = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.ArgMax= zeros(1, StatFile_JS.len_JS);
% StatFile_JS.Mean = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.Kalm = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.NBigKalm2_w0 = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.BigKalm2_w0 = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.NKalm2_w0 = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.Kalm2_w0 = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.NKalm2 = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.Kalm2 = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.KalmBand = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.KalmBand2 = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.NK2PLL = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.K2PLL = zeros(1, StatFile_JS.len_JS);
% 
% % 
% StatFile_JS.backup = 0;
% save('Stat_JS.mat', 'StatFile_JS');

load('Stat_JS.mat', 'StatFile_JS');

% filen = sprintf('backup/Stat_backup_%03.0f.mat', StatFile_JS_JS.backup+1);
% save(filen, 'StatFile_JS_JS');
% StatFile_JS_JS.backup = StatFile_JS_JS.backup+1;
save('Stat_JS_Backup.mat', 'StatFile_JS');

for i = 1:length(Erro.JS)
    for j = 1:StatFile_JS.len_JS
        if Erro.JS(i) == StatFile_JS.JS(j)
            
            if DoStrat
                if ~isnan(Erro.MeanErrPhi_ArgMax(i))
                    StatFile_JS.NArgMax(j) = StatFile_JS.NArgMax(j) + 1;
                    StatFile_JS.ArgMax(j) = StatFile_JS.ArgMax(j) + Erro.MeanErrPhi_ArgMax(i);
                end
                if ~isnan(Erro.MeanErrPhi_Mean(i))
                    StatFile_JS.NMean(j) = StatFile_JS.NMean(j) + 1;
                    StatFile_JS.Mean(j) = StatFile_JS.Mean(j) + Erro.MeanErrPhi_Mean(i);
                end
            end
            
            if DoKalm
                if KalmOrder == 3
                    if ~isnan(Erro.MeanErrPhi_Kalm(i))
                        StatFile_JS.NKalm(j) = StatFile_JS.NKalm(j) + 1;
                        StatFile_JS.Kalm(j) = StatFile_JS.Kalm(j) + Erro.MeanErrPhi_Kalm(i);
                    end      
                    if ~isnan(Erro.KalmBand(i))
                        StatFile_JS.KalmBand(j) = Erro.KalmBand(i);
                    end 
                elseif KalmOrder == 2
                    if ~isnan(Erro.MeanErrPhi_Kalm(i))
                        if ZeroPsiOp == 1
                            if UseCorrHess
                                StatFile_JS.NKalm2_w0_corr(j) = StatFile_JS.NKalm2_w0_corr(j) + 1;
                                StatFile_JS.Kalm2_w0_corr(j) = StatFile_JS.Kalm2_w0_corr(j) + Erro.MeanErrPhi_Kalm(i);
                            else
                                StatFile_JS.NKalm2_w0(j) = StatFile_JS.NKalm2_w0(j) + 1;
                                StatFile_JS.Kalm2_w0(j) = StatFile_JS.Kalm2_w0(j) + Erro.MeanErrPhi_Kalm(i);
                            end
                        else
                            StatFile_JS.NKalm2(j) = StatFile_JS.NKalm2(j) + 1;
                            StatFile_JS.Kalm2(j) = StatFile_JS.Kalm2(j) + Erro.MeanErrPhi_Kalm(i);
                        end                            
                    end
                    if ZeroPsiOp == 0
                        if ~isnan(Erro.KalmBand(i))
                            StatFile_JS.KalmBand2(j) = Erro.KalmBand(i);
                        end
                    end
                end
            end
            
            if DoBigKalm
                if ~isnan(Erro.MeanErrPhi_BigKalm(i))
                    if ZeroPsiOp == 1
                        StatFile_JS.NBigKalm2_w0(j) = StatFile_JS.NBigKalm2_w0(j) + 1;
                        StatFile_JS.BigKalm2_w0(j) = StatFile_JS.BigKalm2_w0(j) + Erro.MeanErrPhi_BigKalm(i);
                    else
                        StatFile_JS.NBigKalm2(j) = StatFile_JS.NBigKalm2(j) + 1;
                        StatFile_JS.BigKalm2(j) = StatFile_JS.BigKalm2(j) + Erro.MeanErrPhi_BigKalm(i);
                    end                            
                end
            end
            
            if Do2PLL
                if ~isnan(Erro.MeanErrPhi_Res2PLL(i))
                    StatFile_JS.NK2PLL(j) = StatFile_JS.NK2PLL(j) + 1;
                    StatFile_JS.K2PLL(j) = StatFile_JS.K2PLL(j) + Erro.MeanErrPhi_Res2PLL(i);
                end
            end      
            
        end
    end
end

save('Stat_JS.mat', 'StatFile_JS')