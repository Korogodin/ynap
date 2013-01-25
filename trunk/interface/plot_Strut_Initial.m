function plot_Strut_Initial(hObject, Kind)
%PLOT_STRUT_INITIAL Initial PD

header; % DO NOT EDIT

global StratResults

if StratResults.nx == 2
    surf(hA, StratResults.X0{2}/2/pi, StratResults.X0{1}/2/pi, StratResults.P0)
    title(hA, 'Initial PD');
    ylabel(hA, '\psi, cycles');
    xlabel(hA, '\psi'', Hz');
    zlabel(hA, 'p(x_k)')
else
    disp('There is not required function: plot_Strut_Initial');
    error;
end

footer;
end

