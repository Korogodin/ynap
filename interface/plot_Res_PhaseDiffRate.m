function plot_Res_PhaseDiffRate(hObject, Kind)
%plot_Res_PhaseDiffRate Plot graphics for phase diffenerece rate and its estimations

header; % DO NOT EDIT

% global ST Cm
global StratResults
global TrueValues
global KRes BigKRes Res2PLL

t = TrueValues.t*1000;
plot(hA, t,  StratResults.ArgMax{2}/2/pi, t,  StratResults.Mean{2}/2/pi, t, BigKRes.X{2}/2/pi, t, KRes.X{2}/2/pi, t, Res2PLL.X{2}/2/pi, t,  TrueValues.psi2/2/pi)
title(hA, 'Phase difference rate');
ylabel(hA, '\psi'', Hz');
xlabel(hA, 't, msec');
grid(hA, 'on');

footer; % DO NOT EDIT
end