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
% StatFile_JS.NKalm2 = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.Kalm2 = zeros(1, StatFile_JS.len_JS);
% 
% StatFile_JS.KalmBand = zeros(1, StatFile_JS.len_JS);
% StatFile_JS.KalmBand2 = zeros(1, StatFile_JS.len_JS);
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
                        StatFile_JS.NKalm2(j) = StatFile_JS.NKalm2(j) + 1;
                        StatFile_JS.Kalm2(j) = StatFile_JS.Kalm2(j) + Erro.MeanErrPhi_Kalm(i);
                    end
                    if ~isnan(Erro.KalmBand(i))
                        StatFile_JS.KalmBand2(j) = Erro.KalmBand(i);
                    end
                end
            end
        end
    end
end

save('Stat_JS.mat', 'StatFile_JS')

% j1 = 0; j2 = 0; j3 = 0;
% for i = 1:StatFile_JS.len_qcno_dB
% 
%     if StatFile_JS.NArgMax(i) > 0
%         j1 = j1+ 1;
%         SFS.qcno_dB_ArgMax(j1) = StatFile_JS.qcno_dB(i);
%         SFS.EArgMax(j1) = StatFile_JS.ArgMax(i) / StatFile_JS.NArgMax(i);
%     end
%     
%     if StatFile_JS.NMean(i) > 0
%         j2 = j2 + 1;
%         SFS.qcno_dB_Mean(j2) = StatFile_JS.qcno_dB(i);
%         SFS.EMean(j2) = StatFile_JS.Mean(i) / StatFile_JS.NMean(i);
%     end
%     
%     if StatFile_JS.NKalm(i) > 0
%         j3 = j3 + 1;
%         SFS.qcno_dB_Kalm(j3) = StatFile_JS.qcno_dB(i);
%         SFS.EKalm(j3) = StatFile_JS.Kalm(i) / StatFile_JS.NKalm(i);
%     end    
% end
% 
% figure(10)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_Kalm, SFS.EKalm)
% xlabel('q_{c/n0}, dBHz')
% ylabel('RMS error of phase difference, cycles');
