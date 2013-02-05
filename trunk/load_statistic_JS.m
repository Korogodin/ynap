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
% StatFile_JS.backup = 0;
% save('Stat_JS.mat', 'StatFile_JS');

load('Stat_JS_0.mat', 'StatFile_JS');

clear SFS;
j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0;
for i = 1:StatFile_JS.len_JS

    if StatFile_JS.NArgMax(i) > 0
        j1 = j1+ 1;
        SFS.JS_ArgMax(j1) = StatFile_JS.JS(i);
        SFS.EArgMax(j1) = StatFile_JS.ArgMax(i) / StatFile_JS.NArgMax(i);
    end
    
    if StatFile_JS.NMean(i) > 0
        j2 = j2 + 1;
        SFS.JS_Mean(j2) = StatFile_JS.JS(i);
        SFS.EMean(j2) = StatFile_JS.Mean(i) / StatFile_JS.NMean(i);
    end
    
    if StatFile_JS.NKalm(i) > 0
        j3 = j3 + 1;
        SFS.JS_Kalm(j3) = StatFile_JS.JS(i);
        SFS.EKalm(j3) = StatFile_JS.Kalm(i) / StatFile_JS.NKalm(i);
    end    
    
    if StatFile_JS.NKalm2(i) > 0
        j4 = j4 + 1;
        SFS.JS_Kalm2(j4) = StatFile_JS.JS(i);
        SFS.EKalm2(j4) = StatFile_JS.Kalm2(i) / StatFile_JS.NKalm2(i);
    end      
    
    if StatFile_JS.KalmBand2(i) > 0
        j5 = j5 + 1;
        SFS.JS_KalmBand2(j5) = StatFile_JS.JS(i);
        SFS.KalmBand2(j5) = StatFile_JS.KalmBand2(i);
    end         
    
    if StatFile_JS.KalmBand(i) > 0
        j6 = j6 + 1;
        SFS.JS_KalmBand(j6) = StatFile_JS.JS(i);
        SFS.KalmBand(j6) = StatFile_JS.KalmBand(i);
    end        
end

% M = 2;
% q = StatFile_JS.JS * 0.02;
% Smeas = 1 / (M - 1) ./ q .* (1 + (M-2)/2 + 1 / 2 ./ q) * 0.02;
% Sksi = 30*0.02 / 0.02;
% SKOh = sqrt(sqrt(4*Sksi*Smeas.^3 * 0.02 * 0.02));

% figure(8)
% [AX, H1, H2] = plotyy(SFS.JS_Kalm, SFS.EKalm, SFS.JS_KalmBand, SFS.KalmBand);
% set(get(AX(1),'Ylabel'),'String','RMS error of phase difference, cycles') 
% set(get(AX(2),'Ylabel'),'String','Band, Hz') 
% xlabel('q_{c/n0}, dBHz')
% 
figure(7)
hold on
plot(SFS.JS_Kalm2, SFS.EKalm2);
hold off
ylabel('RMS error of phase difference, cycles') 
xlabel('J/S, dB')
% 

% figure(10)
% plot(SFS.JS_ArgMax, SFS.EArgMax, SFS.JS_Mean, SFS.EMean, SFS.JS_Kalm, SFS.EKalm, SFS.JS_Kalm2, SFS.EKalm2)
% ylabel('RMS error of phase difference, cycles') 
% xlabel('J/S, dB')

figure(10)
plot(SFS.JS_ArgMax, SFS.EArgMax, SFS.JS_Mean, SFS.EMean, SFS.JS_Kalm2, SFS.EKalm2)
ylabel('RMS error of phase difference, cycles') 
xlabel('J/S, dB')
% xlim([14 50])
% ylim([0 0.165])