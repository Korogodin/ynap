function plot_example(hObject, Kind)
%plot_example Example of plot function for axes

header; % DO NOT EDIT

global Erro

plot(Erro.qcno_dB, Erro.MeanErrPhi_ArgMax, Erro.qcno_dB, Erro.MeanErrPhi_Mean, Erro.qcno_dB, Erro.MeanErrPhi_Kalm);
xlabel('q_{c/n0}, dBHz');
ylabel('Mean error of phase difference, cycles');

footer; % DO NOT EDIT
end
%EDIT NOT DO

