% Controls
if JS_Test
    MW.CG.addControl('pushbutton', 'start_JS_Test(MW)', 'JS Test');
else
    MW.CG.addControl('pushbutton', 'start_stat(MW)', 'Sens');
end
global h_timer
h_timer = MW.CG.addControl2('text', '', 'Timer');

% Panels and Axes 


% Panel of Stratonovich eq
p1 = MW.newPG('Stratonovich', 'Stratonovich', 2, 2);
ArrPlace = zeros(2,2); ArrPlace(1, 1) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Initial');
ArrPlace = zeros(2,2); ArrPlace(1, 2) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Pextr');
ArrPlace = zeros(2,2); ArrPlace(2, 1) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Likehood');
ArrPlace = zeros(2,2); ArrPlace(2, 2) = 1; MW.PG{p1}.newAxes(ArrPlace, 'plot_Strut_Pest');

% Panel of Results
p2 = MW.newPG('All Results', 'Results', 2, 2);
ArrPlace = zeros(2,2); ArrPlace(1, 1) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_PhaseDiff');
ArrPlace = zeros(2,2); ArrPlace(2, 1) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_PhaseDiffRate');
ArrPlace = zeros(2,2); ArrPlace(1, 2) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_ErrorPhaseDiff');
ArrPlace = zeros(2,2); ArrPlace(2, 2) = 1; MW.PG{p2}.newAxes(ArrPlace, 'plot_Res_ErrorPhaseDiffRate');

% Panel of Statistic
p3 = MW.newPG('Statistic', 'Statistic', 1, 1);
ArrPlace = zeros(1,1); ArrPlace(1, 1) = 1; MW.PG{p3}.newAxes(ArrPlace, 'plot_Stat');


% p2 = MW.newPG('Big Kalman', 'Big Kalm', 3, 2);
% p3 = MW.newPG('Mini Kalman', 'Mini Kalm', 2, 4);

% Test
