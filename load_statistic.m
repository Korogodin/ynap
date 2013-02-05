
load('Stat.mat', 'StatFile');

clear SFS;
j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0; j7 = 0; j8 =0; j9 =0; j10 =0;  j11 =0; 
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
    
    if StatFile.NKalm2_w0(i) > 0
        j7 = j7 + 1;
        SFS.qcno_dB_Kalm2_w0(j7) = StatFile.qcno_dB(i);
        SFS.EKalm2_w0(j7) = StatFile.Kalm2_w0(i) / StatFile.NKalm2_w0(i);
    end    
    
    if StatFile.NBigKalm2_w0(i) > 0
        j8 = j8 + 1;
        SFS.qcno_dB_BigKalm2_w0(j8) = StatFile.qcno_dB(i);
        SFS.EBigKalm2_w0(j8) = StatFile.BigKalm2_w0(i) / StatFile.NBigKalm2_w0(i);
    end     
    
    if StatFile.NBigKalm2(i) > 0
        j9 = j9 + 1;
        SFS.qcno_dB_BigKalm2(j9) = StatFile.qcno_dB(i);
        SFS.EBigKalm2(j9) = StatFile.BigKalm2(i) / StatFile.NBigKalm2(i);
    end           
    
    if StatFile.NK2PLL(i) > 0
        j10 = j10 + 1;
        SFS.qcno_dB_K2PLL(j10) = StatFile.qcno_dB(i);
        SFS.EK2PLL(j10) = StatFile.K2PLL(i) / StatFile.NK2PLL(i);
    end       
    
    if StatFile.NKalm2_w0_corr(i) > 0
        j11 = j11 + 1;
        SFS.qcno_dB_Kalm2_w0_corr(j11) = StatFile.qcno_dB(i);
        SFS.EKalm2_w0_corr(j11) = StatFile.Kalm2_w0_corr(i) / StatFile.NKalm2_w0_corr(i);
    end         
end

% M = 2;
% q = StatFile.qcno_dB * 0.02;
% Smeas = 1 / (M - 1) ./ q .* (1 + (M-2)/2 + 1 / 2 ./ q) * 0.02;
% Sksi = 30*0.02 / 0.02;
% SKOh = sqrt(sqrt(4*Sksi*Smeas.^3 * 0.02 * 0.02));

% figure(8)
% [AX, H1, H2] = plotyy(SFS.qcno_dB_Kalm, SFS.EKalm, SFS.qcno_dB_KalmBand, SFS.KalmBand);
% set(get(AX(1),'Ylabel'),'String','RMS error of phase difference, cycles') 
% set(get(AX(2),'Ylabel'),'String','Band, Hz') 
% xlabel('q_{c/n0}, dBHz')
% 
% figure(7)
% hold on
% plot(SFS.qcno_dB_Kalm2, SFS.EKalm2);
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

% figure(10)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_Kalm2, SFS.EKalm2)
% ylabel('RMS error of phase difference, cycles') 
% xlabel('q_{c/n0}, dBHz')
% ylim([0 0.2]);

% figure(11)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2,  SFS.qcno_dB_Kalm2, SFS.EKalm2, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0)
% ylabel('RMS error of phase difference, cycles') 
% xlabel('q_{c/n0}, dBHz')
% ylim([0 0.2]);
% legend('ArgMax', 'Mean', 'BigKalm', 'BigKalm_w0', 'Kalm2', 'Kalm2_w0');

figure(11)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0,  SFS.qcno_dB_Kalm2, SFS.EKalm2, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0, SFS.qcno_dB_K2PLL, SFS.EK2PLL)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax*360, SFS.qcno_dB_Mean, SFS.EMean*360, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2*360, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360,  SFS.qcno_dB_Kalm2, SFS.EKalm2*360, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, SFS.qcno_dB_Kalm2_w0_corr, SFS.EKalm2_w0_corr*360, SFS.qcno_dB_K2PLL, SFS.EK2PLL*360)
plot(SFS.qcno_dB_ArgMax, SFS.EArgMax*360, SFS.qcno_dB_Mean, SFS.EMean*360, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2*360, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360,  SFS.qcno_dB_Kalm2, SFS.EKalm2*360, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, SFS.qcno_dB_K2PLL, SFS.EK2PLL*360)
ylabel('RMS error of phase difference, deg') 
xlabel('q_{c/n0}, dBHz')
% ylim([0 0.15]);
ylim([0 0.15]*360);
% legend( 'ArgMax', 'Mean', 'BigKalm', 'BigKalm_{w0}', 'Kalm2', 'Kalm2_{w0}', 'Kalm2_{w0}_{corr}', '2PLL');
grid on
