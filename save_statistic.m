% load('Stat.mat', 'StatFile');

% StatFile.qcno_dB = 1:0.5:50;
% StatFile.len_qcno_dB = length(StatFile.qcno_dB);
% 
% StatFile.NArgMax = zeros(1, StatFile.len_qcno_dB);
% StatFile.NMean = zeros(1, StatFile.len_qcno_dB);
% StatFile.NKalm = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.ArgMax= zeros(1, StatFile.len_qcno_dB);
% StatFile.Mean = zeros(1, StatFile.len_qcno_dB);
% StatFile.Kalm = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.NKalm2 = zeros(1, StatFile.len_qcno_dB);
% StatFile.Kalm2 = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.NKalm2_w0 = zeros(1, StatFile.len_qcno_dB); % psi' op = 0
% StatFile.Kalm2_w0 = zeros(1, StatFile.len_qcno_dB); 
% 
% StatFile.NKalm2_w0_corr = zeros(1, StatFile.len_qcno_dB); % psi' op = 0
% StatFile.Kalm2_w0_corr = zeros(1, StatFile.len_qcno_dB); 
% 
% StatFile.NBigKalm2 = zeros(1, StatFile.len_qcno_dB); 
% StatFile.BigKalm2 = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.NBigKalm2_w0 = zeros(1, StatFile.len_qcno_dB); % psi' op = 0
% StatFile.BigKalm2_w0 = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.KalmBand = zeros(1, StatFile.len_qcno_dB);
% StatFile.KalmBand2 = zeros(1, StatFile.len_qcno_dB);
% % 
% StatFile.NK2PLL = zeros(1, StatFile.len_qcno_dB);
% StatFile.K2PLL = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.backup = 0;
% save('Stat.mat', 'StatFile');

load('Stat.mat', 'StatFile');

% filen = sprintf('backup/Stat_backup_%03.0f.mat', StatFile.backup+1);
% save(filen, 'StatFile');
% StatFile.backup = StatFile.backup+1;
save('StatBackup.mat', 'StatFile');

for i = 1:length(Erro.qcno_dB)
    for j = 1:StatFile.len_qcno_dB
        if Erro.qcno_dB(i) == StatFile.qcno_dB(j)
            
            if DoStrat
                if ~isnan(Erro.MeanErrPhi_ArgMax(i))
                    StatFile.NArgMax(j) = StatFile.NArgMax(j) + 1;
                    StatFile.ArgMax(j) = StatFile.ArgMax(j) + Erro.MeanErrPhi_ArgMax(i);
                end
                if ~isnan(Erro.MeanErrPhi_Mean(i))
                    StatFile.NMean(j) = StatFile.NMean(j) + 1;
                    StatFile.Mean(j) = StatFile.Mean(j) + Erro.MeanErrPhi_Mean(i);
                end
            end
            
            if DoKalm
                if KalmOrder == 3
                    if ~isnan(Erro.MeanErrPhi_Kalm(i))
                        StatFile.NKalm(j) = StatFile.NKalm(j) + 1;
                        StatFile.Kalm(j) = StatFile.Kalm(j) + Erro.MeanErrPhi_Kalm(i);
                    end      
                    if ~isnan(Erro.KalmBand(i))
                        StatFile.KalmBand(j) = Erro.KalmBand(i);
                    end 
                elseif KalmOrder == 2
                    if ~isnan(Erro.MeanErrPhi_Kalm(i))
                        if ZeroPsiOp == 1
                            if UseCorrHess
                                StatFile.NKalm2_w0_corr(j) = StatFile.NKalm2_w0_corr(j) + 1;
                                StatFile.Kalm2_w0_corr(j) = StatFile.Kalm2_w0_corr(j) + Erro.MeanErrPhi_Kalm(i);
                            else
                                StatFile.NKalm2_w0(j) = StatFile.NKalm2_w0(j) + 1;
                                StatFile.Kalm2_w0(j) = StatFile.Kalm2_w0(j) + Erro.MeanErrPhi_Kalm(i);
                            end
                        else
                            StatFile.NKalm2(j) = StatFile.NKalm2(j) + 1;
                            StatFile.Kalm2(j) = StatFile.Kalm2(j) + Erro.MeanErrPhi_Kalm(i);
                        end                            
                    end
                    if ZeroPsiOp == 0
                        if ~isnan(Erro.KalmBand(i))
                            StatFile.KalmBand2(j) = Erro.KalmBand(i);
                        end
                    end
                end
            end
            
            if DoBigKalm
                if ~isnan(Erro.MeanErrPhi_BigKalm(i))
                    if ZeroPsiOp == 1
                        StatFile.NBigKalm2_w0(j) = StatFile.NBigKalm2_w0(j) + 1;
                        StatFile.BigKalm2_w0(j) = StatFile.BigKalm2_w0(j) + Erro.MeanErrPhi_BigKalm(i);
                    else
                        StatFile.NBigKalm2(j) = StatFile.NBigKalm2(j) + 1;
                        StatFile.BigKalm2(j) = StatFile.BigKalm2(j) + Erro.MeanErrPhi_BigKalm(i);
                    end                            
                end
            end
            
            if Do2PLL
                if ~isnan(Erro.MeanErrPhi_Res2PLL(i))
                    StatFile.NK2PLL(j) = StatFile.NK2PLL(j) + 1;
                    StatFile.K2PLL(j) = StatFile.K2PLL(j) + Erro.MeanErrPhi_Res2PLL(i);
                end
            end                
            
        end
    end
end

save('Stat.mat', 'StatFile')
