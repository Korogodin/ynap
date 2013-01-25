function plot_Strut_Pextr(hObject, Kind)
%PLOT_STRUT_PEXTR Aposteriori PD (extrapolation)

header; % DO NOT EDIT

global StratResults
global TrueValues

if StratResults.nx == 2
    surf(hA, StratResults.Xextr{2}/2/pi, StratResults.Xextr{1}/2/pi, StratResults.Pextr)
    title(hA, ['Extrapolation, ' sprintf('k = %.0f, t = %.3f s', StratResults.k, (StratResults.k-1)*StratResults.T)]);
    ylabel(hA, '\psi, cycles');
    xlabel(hA, '\psi'', Hz');
    zlabel(hA, 'p(x_{k}|Y_{k-1})')
else
    disp('Need function in plot_Strut_Pest');
    error;
end

footer;
end