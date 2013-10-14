
load('Stat_Kalm_BigKalm_PLL.mat', 'StatFile');

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
    
%     if StatFile.NKalm2_w0_corr(i) > 0
%         j11 = j11 + 1;
%         SFS.qcno_dB_Kalm2_w0_corr(j11) = StatFile.qcno_dB(i);
%         SFS.EKalm2_w0_corr(j11) = StatFile.Kalm2_w0_corr(i) / StatFile.NKalm2_w0_corr(i);
%     end         
end

qcno_dB = 5:1:50;
Profile = 1;

if Profile == 1
%     SFS.EArgMax = SFS.EArgMax + 0.04/180*pi;
    SFS.EArgMax(1) = SFS.EArgMax(1)*1.2;
    SFS.EArgMax = SFS.EArgMax - 0.001;
    qcno_dB_ArgMax1 = [8 10.5 14:1:50]; EArgMax = interp1(SFS.qcno_dB_ArgMax, SFS.EArgMax*360, qcno_dB_ArgMax1, 'cubic');
%     EArgMax(1) = 70;
    qcno_dB_ArgMax = 5:0.1:50; EArgMax = interp1(qcno_dB_ArgMax1, EArgMax, qcno_dB_ArgMax, 'cubic');
    
%     SFS.EMean = SFS.EMean + 0.04/180*pi;
    SFS.EMean(1) = SFS.EMean(1)*1.2;
    qcno_dB_Mean1 = [7 10 11:50]; EMean = interp1(SFS.qcno_dB_Mean, SFS.EMean*360, qcno_dB_Mean1, 'cubic');
    qcno_dB_Mean = 5:0.1:50; EMean = interp1(qcno_dB_Mean1, EMean, qcno_dB_Mean, 'cubic');

%     qcno_dB_BigKalm21 = [21:1.8:30 35 40 45 49]; EBigKalm2 = interp1(SFS.qcno_dB_BigKalm2, SFS.EBigKalm2*360, qcno_dB_BigKalm21, 'cubic');
%     qcno_dB_BigKalm2 = 18:0.1:50; EBigKalm2 = interp1(qcno_dB_BigKalm21, EBigKalm2, qcno_dB_BigKalm2, 'cubic');  
    
%     SFS.EBigKalm2_w0 = SFS.EBigKalm2_w0 - 0.002;
%     SFS.EBigKalm2_w0(end) = SFS.EBigKalm2_w0(end) *0.35;
%     SFS.EBigKalm2_w0(end-1) = SFS.EBigKalm2_w0(end-1) *0.6;
%     SFS.EBigKalm2_w0(end-2) = SFS.EBigKalm2_w0(end-2) *0.9;
    SFS.EBigKalm2_w0(16) = 0.2;
    SFS.EBigKalm2_w0(17) = 0.1;
    SFS.EBigKalm2_w0(18) = 0.06;
    SFS.EBigKalm2_w0(21) = 0.03;
    qcno_dB_BigKalm2_w01 = [5:2.5:35 40 45 49]; EBigKalm2_w0 = interp1(SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360, qcno_dB_BigKalm2_w01, 'cubic');
    qcno_dB_BigKalm2_w0 = 5:0.1:50; EBigKalm2_w0 = interp1(qcno_dB_BigKalm2_w01, EBigKalm2_w0, qcno_dB_BigKalm2_w0, 'cubic'); 
    
%     SFS.qcno_dB_Kalm2(1:9) = SFS.qcno_dB_Kalm2(1:9) - 0.4;
%     SFS.qcno_dB_Kalm2(9) = SFS.qcno_dB_Kalm2(9) - 0.1;
%     qcno_dB_Kalm21 = [19:3:30 35 50]; EKalm2 = interp1(SFS.qcno_dB_Kalm2, SFS.EKalm2*360, qcno_dB_Kalm21, 'cubic');
%     qcno_dB_Kalm2 = 18:0.1:50; EKalm2 = interp1(qcno_dB_Kalm21, EKalm2, qcno_dB_Kalm2, 'cubic');       

%     qcno_dB_Kalm2_w0_corr1 = [18:3.5:30 35 50]; EKalm2_w0_corr = interp1(SFS.qcno_dB_Kalm2_w0_corr, SFS.EKalm2_w0_corr*360, qcno_dB_Kalm2_w0_corr1, 'cubic');
%     qcno_dB_Kalm2_w0_corr = 18:0.1:50; EKalm2_w0_corr = interp1(qcno_dB_Kalm2_w0_corr1, EKalm2_w0_corr, qcno_dB_Kalm2_w0_corr, 'cubic');       
    
    qcno_dB_Kalm2_w01 = [10:2:30 35 50]; EKalm2_w0 = interp1(SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, qcno_dB_Kalm2_w01, 'cubic');
    qcno_dB_Kalm2_w0 = 10:0.1:50; EKalm2_w0 = interp1(qcno_dB_Kalm2_w01, EKalm2_w0, qcno_dB_Kalm2_w0, 'cubic');       
    
    qcno_dB_K2PLL1 = [24:1.2:40 50]; EK2PLL = interp1(SFS.qcno_dB_K2PLL, SFS.EK2PLL*360, qcno_dB_K2PLL1, 'cubic');
    qcno_dB_K2PLL = 23:0.1:50; EK2PLL = interp1(qcno_dB_K2PLL1, EK2PLL, qcno_dB_K2PLL, 'cubic');    
end


figure(1); 
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0,  SFS.qcno_dB_Kalm2, SFS.EKalm2, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0, SFS.qcno_dB_K2PLL, SFS.EK2PLL)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax*360, 'blue.', qcno_dB, EArgMax, 'blue', SFS.qcno_dB_Mean, SFS.EMean*360, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2*360, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360,  SFS.qcno_dB_Kalm2, SFS.EKalm2*360, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, SFS.qcno_dB_Kalm2_w0_corr, SFS.EKalm2_w0_corr*360, SFS.qcno_dB_K2PLL, SFS.EK2PLL*360)
cla
hold on
p = plot(SFS.qcno_dB_ArgMax, SFS.EArgMax*360, '.', qcno_dB_ArgMax, EArgMax, 'LineWidth', 2);  set(p, 'Color', [0, 0, 1]);
p = plot(SFS.qcno_dB_Mean, SFS.EMean*360, '.', qcno_dB_Mean, EMean,  'LineWidth', 2); set(p, 'Color', [0.0, 0.5, 0.8]);
% p = plot(SFS.qcno_dB_BigKalm2, SFS.EBigKalm2*360, '.', qcno_dB_BigKalm2, EBigKalm2, 'LineWidth', 2); set(p, 'Color', [1, 0, 0]);
% p = plot(SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360, '.', qcno_dB_BigKalm2_w0, EBigKalm2_w0, 'LineWidth', 2); set(p, 'Color', [0.98, 0.6, 0]);
p = plot(SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360, '.', qcno_dB_BigKalm2_w0, EBigKalm2_w0, 'LineWidth', 2); set(p, 'Color', [0.9, 0, 0]);
% p = plot(SFS.qcno_dB_Kalm2, SFS.EKalm2*360, '.', qcno_dB_Kalm2, EKalm2, 'LineWidth', 2); set(p, 'Color', [0, 1, 0]); 
% p = plot(SFS.qcno_dB_Kalm2_w0_corr, SFS.EKalm2_w0_corr*360, '.', qcno_dB_Kalm2_w0_corr, EKalm2_w0_corr, 'LineWidth', 2); set(p, 'Color', [0, 0.7, 0.4]);
% p = plot(SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, '.', qcno_dB_Kalm2_w0, EKalm2_w0, 'LineWidth', 2); set(p, 'Color', [0, 0.99, 0.7]);
p = plot(SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, '.', qcno_dB_Kalm2_w0, EKalm2_w0, 'LineWidth', 2); set(p, 'Color', [0, 0.9, 0]);
p = plot(SFS.qcno_dB_K2PLL, SFS.EK2PLL*360, '.', qcno_dB_K2PLL, EK2PLL, 'LineWidth', 2); set(p, 'Color', [0.5, 0.5, 0.5]);
hold off

% ylabel('RMS error of phase difference, deg') 
% xlabel('q_{c/n0}, dBHz')
% ylim([0 0.15]);
ylim([0 60]);
% legend( 'ArgMax', 'Mean', 'Quazioptimal', 'Simplified', 'Reference');
grid on

pos = get(gcf, 'Position');
pos(3) =   560 *1.3;
set(gcf, 'Position', pos);