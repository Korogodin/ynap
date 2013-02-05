try 
    close(MW.handle); % Close old output form
end
try
    clear TrueValues 
    StratResults.delete();
    clear Erro KRes BigKRes Res2PLL
end

close all
clear 
clc

globals;

rng('shuffle'); % Reinit for randn

addpath([pwd '/callback']); % Callbacks for Control Panel
addpath([pwd '/basic-interface']); % Functions for base interface
addpath([pwd '/interface']); % Functions for interface
addpath([pwd '/stratonovich']); % Class of integral solution of Stratonovich equation
addpath([pwd '/kalman']); % Classes of Kalman filters

DoStrat = 0;
DoKalm = 1;
DoBigKalm = 1;
Do2PLL = 0;

ZeroPsiOp = 1;
UseCorrHess = 0;

KalmOrder = 2;
SinDyn = 0;

JS_Test = 0;

MW = CMainWindow('Multiantennas receiver');
if MW.handle == 0
    clear MW;
    return;
end

interface;

