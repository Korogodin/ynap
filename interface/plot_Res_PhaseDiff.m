function plot_Res_PhaseDiff(hObject, Kind)
%plot_Res_PhaseDiff Plot graphics for phase diffenerence and its estimations

header; % DO NOT EDIT

% global ST Cm
global StratResults
global TrueValues

t = TrueValues.t*1000;
plot(hA, t,  TrueValues.psi1/2/pi, t,  StratResults.ArgMax{1}/2/pi, t,  StratResults.Mean{1}/2/pi)
title(hA, 'Phase difference');
ylabel(hA, '\psi, cycles');
xlabel(hA, 't, msec');
grid(hA, 'on');

footer; % DO NOT EDIT
end