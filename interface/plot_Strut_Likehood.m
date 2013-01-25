function plot_Strut_Likehood(hObject, Kind)
%PLOT_STRUT_LIKEHOOD Plot Likehood function

header; % DO NOT EDIT

global StratResults

if StratResults.nx == 2
    if StratResults.LogMode
        % L_in_Np = argBessel - 0.5*(log(argBessel) + log(2*pi))
        surf(hA, StratResults.Xextr{2}/2/pi, StratResults.Xextr{1}/2/pi, StratResults.dBtoNp*StratResults.lnL)
        title(hA, 'Mean Likehood L(x) in dB scale');
        zlabel('L(x), dB')
    else
        surf(hA, StratResults.Xextr{2}/2/pi, StratResults.Xextr{1}/2/pi, exp(StratResults.lnL))
        title(hA, 'Mean Likehood L(x)');
        zlabel('L(x)')
    end
else
    disp('There is not required function: plot_Strut_Likehood');
    error;
end

ylabel(hA, '\psi, cycles');
xlabel(hA, '\psi'', Hz');

footer;
end