function plot_Res_ErrorPhaseDiff(hObject, Kind)
%plot_Res_ErrorPhaseDiff Plot graphics for errors of phase diffenerece

header; % DO NOT EDIT

% global ST Cm
global StratResults KRes
global TrueValues BigKRes Res2PLL

t = TrueValues.t*1000;
plot(hA, t,  (StratResults.ArgMax{1}-TrueValues.psi1)/2/pi, t,  (StratResults.Mean{1}-TrueValues.psi1)/2/pi, t,  (BigKRes.X{1}-TrueValues.psi1)/2/pi, t,  (KRes.X{1}-TrueValues.psi1)/2/pi, t, (Res2PLL.X{1}-TrueValues.psi1)/2/pi)
title(hA, 'Error of phase difference estimation');
ylabel(hA, '\psi, cycles');
xlabel(hA, 't, msec');
grid(hA, 'on');

footer; % DO NOT EDIT
end