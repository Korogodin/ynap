function plot_Strut_Pest(hObject, Kind)
%PLOT_STRUT_PEST Aposteriori PD (estimation)

header; % DO NOT EDIT


global StratResults
global TrueValues

if StratResults.nx == 2
    if length(StratResults.Xest{1}) == 1
        plot(hA, StratResults.Xest{2}/2/pi, StratResults.Pest);
        ylabel(hA, 'p(x_k|Y_k)')
        xlabel(hA, '\psi'', Hz');
    elseif length(StratResults.Xest{2}) == 1
        plot(hA, StratResults.Xest{1}/2/pi, StratResults.Pest)
        ylabel(hA, 'p(x_k|Y_k)')
        xlabel(hA, '\psi, cycles');
    else        
        surf(hA, StratResults.Xest{2}/2/pi, StratResults.Xest{1}/2/pi, StratResults.Pest)
        title(hA, ['Aposteriori probability density and True value, ' sprintf('k = %.0f, t = %.3f s', StratResults.k, StratResults.k*StratResults.T)]);
        zlabel(hA, 'p(x_k|Y_k)')
        ylabel(hA, '\psi, cycles');
        xlabel(hA, '\psi'', Hz');
        hold(hA, 'on');
        %             plot3(hA,  [Xs(2)/2/pi, Xs(2)/2/pi], [Xs(1)/2/pi, Xs(1)/2/pi], [0, 1.2*max(max(pest))], 'r', ...
        %                 Xs(2)/2/pi, Xs(1)/2/pi, 1.2*max(max(pest)), 'r*');
        maxpest = max(max(StratResults.Pest));
        plot3(hA,  [StratResults.ArgMax{2}(StratResults.k)/2/pi, StratResults.ArgMax{2}(StratResults.k)/2/pi], ...
            [StratResults.ArgMax{1}(StratResults.k)/2/pi, StratResults.ArgMax{1}(StratResults.k)/2/pi], [0, 1.2*maxpest], 'r', ...
            StratResults.ArgMax{2}(StratResults.k)/2/pi, StratResults.ArgMax{1}(StratResults.k)/2/pi, 1.2*maxpest, 'r*');
        hold(hA, 'off');
    end
else
    disp('Need function in plot_Strut_Pest');
    error;
end

footer;
end