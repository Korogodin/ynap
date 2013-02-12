function plot_Stat(hObject, Kind)
%plot_example Example of plot function for axes

header; % DO NOT EDIT

global Erro JS_Test

if JS_Test
    plot(Erro.JS, Erro.MeanErrPhi_ArgMax, Erro.JS, Erro.MeanErrPhi_Mean, Erro.JS, Erro.MeanErrPhi_BigKalm, Erro.JS, Erro.MeanErrPhi_Kalm, Erro.JS, Erro.MeanErrPhi_Res2PLL);
    xlabel('J/S, dB');
else
    plot(Erro.qcno_dB, Erro.MeanErrPhi_ArgMax, Erro.qcno_dB, Erro.MeanErrPhi_Mean, Erro.qcno_dB, Erro.MeanErrPhi_BigKalm, Erro.qcno_dB, Erro.MeanErrPhi_Kalm, Erro.qcno_dB, Erro.MeanErrPhi_Res2PLL);
    xlabel('q_{c/n0}, dBHz');
end

ylabel('Mean error of phase difference, cycles');

footer; % DO NOT EDIT
end
%EDIT NOT DO

