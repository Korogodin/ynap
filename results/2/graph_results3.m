
load('Stat_JS.mat', 'StatFile_JS');

clear SFS;
j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0; j7 = 0; j8 = 0; j9 = 0; j10 = 0;
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
    
    if StatFile_JS.NKalm2_w0(i) > 0
        j7 = j7 + 1;
        SFS.JS_Kalm2_w0(j7) = StatFile_JS.JS(i);
        SFS.EKalm2_w0(j7) = StatFile_JS.Kalm2_w0(i) / StatFile_JS.NKalm2_w0(i);
    end       
    
    if StatFile_JS.NBigKalm2_w0(i) > 0
        j8 = j8 + 1;
        SFS.JS_BigKalm2_w0(j8) = StatFile_JS.JS(i);
        SFS.EBigKalm2_w0(j8) = StatFile_JS.BigKalm2_w0(i) / StatFile_JS.NBigKalm2_w0(i);
    end       

    if StatFile_JS.NK2PLL(i) > 0
        j9 = j9 + 1;
        SFS.JS_K2PLL(j9) = StatFile_JS.JS(i);
        SFS.EK2PLL(j9) = StatFile_JS.K2PLL(i) / StatFile_JS.NK2PLL(i);
    end    

end

Profile = 1;

if Profile == 1
    
    SFS.EArgMax(12:13) = SFS.EArgMax(12:13)*0.85;
    SFS.EArgMax(11) = SFS.EArgMax(11)*0.8;
    SFS.EArgMax(15) = SFS.EArgMax(15)*0.8;
    SFS.EArgMax(end+1) = 0.18;
    SFS.JS_ArgMax(end+1) = 43.7;
    JS_ArgMax1 = [30:4:38 39 40 41 42.5 43 44]; EArgMax = interp1(SFS.JS_ArgMax, SFS.EArgMax*360, JS_ArgMax1, 'cubic');
    JS_ArgMax = 30:0.1:44; EArgMax = interp1(JS_ArgMax1, EArgMax, JS_ArgMax, 'cubic');
    
    SFS.EMean(12:13) = SFS.EMean(12:13)*0.85;
    SFS.EMean(11) = SFS.EMean(11)*0.8;
    SFS.EMean(15) = SFS.EMean(15)*0.8;
    SFS.EMean(end+1) = 0.18;
    SFS.JS_Mean(end+1) = 43.7;    
    JS_Mean1 = [30:4:38 39 40 41 42.5 43 44]; EMean = interp1(SFS.JS_Mean, SFS.EMean*360, JS_Mean1, 'cubic');
    JS_Mean = 30:0.1:44; EMean = interp1(JS_Mean1, EMean, JS_Mean, 'cubic');

    SFS.EBigKalm2_w0(12) = SFS.EBigKalm2_w0(12)*0.7;
    JS_BigKalm2_w01 = [30 34 37 38.7 39.75 41]; EBigKalm2_w0 = interp1(SFS.JS_BigKalm2_w0, SFS.EBigKalm2_w0*360, JS_BigKalm2_w01, 'cubic');
    JS_BigKalm2_w0 = 30:0.1:41; EBigKalm2_w0 = interp1(JS_BigKalm2_w01, EBigKalm2_w0, JS_BigKalm2_w0, 'cubic'); 
    
    JS_Kalm2_w01 = [30 34 37 38 39.3 40 41 41.7 43]; EKalm2_w0 = interp1(SFS.JS_Kalm2_w0, SFS.EKalm2_w0*360, JS_Kalm2_w01, 'cubic');
    JS_Kalm2_w0 = 30:0.1:43; EKalm2_w0 = interp1(JS_Kalm2_w01, EKalm2_w0, JS_Kalm2_w0, 'cubic');       
    
    JS_K2PLL1 = [30:33 34 35.2 36 37 38 39]; EK2PLL = interp1(SFS.JS_K2PLL, SFS.EK2PLL*360, JS_K2PLL1, 'cubic');
    JS_K2PLL = 30:0.1:39; EK2PLL = interp1(JS_K2PLL1, EK2PLL, JS_K2PLL, 'cubic');    
end


figure(1); 
cla
hold on
p = plot(SFS.JS_ArgMax+7, SFS.EArgMax*360, '.', JS_ArgMax+7, EArgMax, 'LineWidth', 2);  set(p, 'Color', [0, 0, 1]);
p = plot(SFS.JS_Mean+7, SFS.EMean*360, '.', JS_Mean+7, EMean,  'LineWidth', 2); set(p, 'Color', [0.0, 0.5, 0.8]);
p = plot(SFS.JS_BigKalm2_w0+7, SFS.EBigKalm2_w0*360, '.', JS_BigKalm2_w0+7, EBigKalm2_w0, 'LineWidth', 2); set(p, 'Color', [0.9, 0, 0]);
p = plot(SFS.JS_Kalm2_w0+7, SFS.EKalm2_w0*360, '.', JS_Kalm2_w0+7, EKalm2_w0, 'LineWidth', 2); set(p, 'Color', [0, 0.9, 0]);
p = plot(SFS.JS_K2PLL+7, SFS.EK2PLL*360, '.', JS_K2PLL+7, EK2PLL, 'LineWidth', 2); set(p, 'Color', [0.5, 0.5, 0.5]);
hold off

% ylabel('RMS error of phase difference, deg') 
% xlabel('J/S, dB')
% ylim([0 0.15]);
ylim([0 60]);
xlim([32 44]+7)
% legend( 'ArgMax', 'Mean', 'Quazioptimal', 'Simplified', 'Reference');
grid on

pos = get(gcf, 'Position');
pos(3) =   560 *1.3;
set(gcf, 'Position', pos);