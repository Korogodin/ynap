function plot_Res_ErrorPhaseDiffRate(hObject, Kind)
%plot_Res_ ErrorPhaseDiffRate Plot graphics for errors of phase diffenerence rate

header; % DO NOT EDIT

global StratResults
global TrueValues
global KRes
t = TrueValues.t*1000;
plot(hA, t, (StratResults.ArgMax{2}-TrueValues.psi2)/2/pi, t,  (StratResults.Mean{2}-TrueValues.psi2)/2/pi, t, (KRes.X{2}-TrueValues.psi2)/2/pi)
title(hA, 'Error of phase difference rate estimation');
ylabel(hA, '\psi'', Hz');
xlabel(hA, 't, msec');
grid(hA, 'on');

footer; % DO NOT EDIT
end
