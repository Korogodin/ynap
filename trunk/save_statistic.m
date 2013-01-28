% load('Stat.mat', 'StatFile');

% StatFile.qcno_dB = 1:0.5:50;
% StatFile.len_qcno_dB = length(StatFile.qcno_dB);

% StatFile.NArgMax = zeros(1, StatFile.len_qcno_dB);
% StatFile.NMean = zeros(1, StatFile.len_qcno_dB);
% StatFile.NKalm = zeros(1, StatFile.len_qcno_dB);

% StatFile.ArgMax= zeros(1, StatFile.len_qcno_dB);
% StatFile.Mean = zeros(1, StatFile.len_qcno_dB);
% StatFile.Kalm = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.NKalm2 = zeros(1, StatFile.len_qcno_dB);
% StatFile.Kalm2 = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.KalmBand = zeros(1, StatFile.len_qcno_dB);
% StatFile.KalmBand2 = zeros(1, StatFile.len_qcno_dB);

% StatFile.backup = 0;
% save('Stat.mat', 'StatFile');

load('Stat.mat', 'StatFile');

% filen = sprintf('backup/Stat_backup_%03.0f.mat', StatFile.backup+1);
% save(filen, 'StatFile');
% StatFile.backup = StatFile.backup+1;
save('StatKalm.mat', 'StatFile');

for i = 1:length(Erro.qcno_dB)
    for j = 1:StatFile.len_qcno_dB
        if Erro.qcno_dB(i) == StatFile.qcno_dB(j)
            if ~isnan(Erro.MeanErrPhi_ArgMax(i))
                StatFile.NArgMax(j) = StatFile.NArgMax(j) + 1;
                StatFile.ArgMax(j) = StatFile.ArgMax(j) + Erro.MeanErrPhi_ArgMax(i);
            end
            if ~isnan(Erro.MeanErrPhi_Mean(i))
                StatFile.NMean(j) = StatFile.NMean(j) + 1;
                StatFile.Mean(j) = StatFile.Mean(j) + Erro.MeanErrPhi_Mean(i);
            end       
            if ~isnan(Erro.MeanErrPhi_Kalm(i))
                StatFile.NKalm(j) = StatFile.NKalm(j) + 1;
                StatFile.Kalm(j) = StatFile.Kalm(j) + Erro.MeanErrPhi_Kalm(i);
            end      
%             if ~isnan(Erro.MeanErrPhi_Kalm(i))
%                 StatFile.NKalm2(j) = StatFile.NKalm2(j) + 1;
%                 StatFile.Kalm2(j) = StatFile.Kalm2(j) + Erro.MeanErrPhi_Kalm(i);
%             end     
            
            if ~isnan(Erro.KalmBand(i))
                StatFile.KalmBand(j) = Erro.KalmBand(i);
            end 
%             if ~isnan(Erro.KalmBand(i))
%                 StatFile.KalmBand2(j) = Erro.KalmBand(i);
%             end    
            
        end
    end
end

save('Stat.mat', 'StatFile')

% j1 = 0; j2 = 0; j3 = 0;
% for i = 1:StatFile.len_qcno_dB
% 
%     if StatFile.NArgMax(i) > 0
%         j1 = j1+ 1;
%         SFS.qcno_dB_ArgMax(j1) = StatFile.qcno_dB(i);
%         SFS.EArgMax(j1) = StatFile.ArgMax(i) / StatFile.NArgMax(i);
%     end
%     
%     if StatFile.NMean(i) > 0
%         j2 = j2 + 1;
%         SFS.qcno_dB_Mean(j2) = StatFile.qcno_dB(i);
%         SFS.EMean(j2) = StatFile.Mean(i) / StatFile.NMean(i);
%     end
%     
%     if StatFile.NKalm(i) > 0
%         j3 = j3 + 1;
%         SFS.qcno_dB_Kalm(j3) = StatFile.qcno_dB(i);
%         SFS.EKalm(j3) = StatFile.Kalm(i) / StatFile.NKalm(i);
%     end    
% end
% 
% figure(10)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_Kalm, SFS.EKalm)
% xlabel('q_{c/n0}, dBHz')
% ylabel('RMS error of phase difference, cycles');
