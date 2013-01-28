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
% StatFile.backup = 0;
% save('Stat.mat', 'StatFile');

load('Stat.mat', 'StatFile');

clear SFS;
j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0;
for i = 1:StatFile.len_qcno_dB

    if StatFile.NArgMax(i) > 0
        j1 = j1+ 1;
        SFS.qcno_dB_ArgMax(j1) = StatFile.qcno_dB(i);
        SFS.EArgMax(j1) = StatFile.ArgMax(i) / StatFile.NArgMax(i);
    end
    
    if StatFile.NMean(i) > 0
        j2 = j2 + 1;
        SFS.qcno_dB_Mean(j2) = StatFile.qcno_dB(i);
        SFS.EMean(j2) = StatFile.Mean(i) / StatFile.NMean(i);
    end
    
    if StatFile.NKalm(i) > 0
        j3 = j3 + 1;
        SFS.qcno_dB_Kalm(j3) = StatFile.qcno_dB(i);
        SFS.EKalm(j3) = StatFile.Kalm(i) / StatFile.NKalm(i);
    end    
    
    if StatFile.NKalm2(i) > 0
        j4 = j4 + 1;
        SFS.qcno_dB_Kalm2(j4) = StatFile.qcno_dB(i);
        SFS.EKalm2(j4) = StatFile.Kalm2(i) / StatFile.NKalm2(i);
    end      
    
    if StatFile.KalmBand2(i) > 0
        j5 = j5 + 1;
        SFS.qcno_dB_KalmBand2(j5) = StatFile.qcno_dB(i);
        SFS.KalmBand2(j5) = StatFile.KalmBand2(i);
    end         
    
    if StatFile.KalmBand(i) > 0
        j6 = j6 + 1;
        SFS.qcno_dB_KalmBand(j6) = StatFile.qcno_dB(i);
        SFS.KalmBand(j6) = StatFile.KalmBand(i);
    end        
end


% figure(8)
% [AX, H1, H2] = plotyy(SFS.qcno_dB_Kalm, SFS.EKalm, SFS.qcno_dB_KalmBand, SFS.KalmBand);
% set(get(AX(1),'Ylabel'),'String','RMS error of phase difference, cycles') 
% set(get(AX(2),'Ylabel'),'String','Band, Hz') 
% xlabel('q_{c/n0}, dBHz')
% 
% figure(7)
% hold on
% plot(SFS.qcno_dB_Kalm, SFS.EKalm);
% hold off
% ylabel('RMS error of phase difference, cycles') 
% xlabel('q_{c/n0}, dBHz')
% 
% figure(9)
% [AX, H1, H2] = plotyy(SFS.qcno_dB_Kalm2, SFS.EKalm2, SFS.qcno_dB_KalmBand2, SFS.KalmBand2);
% set(get(AX(1),'Ylabel'),'String','RMS error of phase difference, cycles') 
% set(get(AX(2),'Ylabel'),'String','Band, Hz') 
% xlabel('q_{c/n0}, dBHz')

% figure(10)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_Kalm, SFS.EKalm, SFS.qcno_dB_Kalm2, SFS.EKalm2)
% ylabel('RMS error of phase difference, cycles') 
% xlabel('q_{c/n0}, dBHz')

figure(10)
plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_Kalm, SFS.EKalm)
ylabel('RMS error of phase difference, cycles') 
xlabel('q_{c/n0}, dBHz')
xlim([14 50])
ylim([0 0.165])