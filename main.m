try 
    close(MW.handle); % Close old output form
end
try
    clear TrueValues 
    StratResults.delete();
    clear Erro
end

close all
clear 
clc

globals;

rng('shuffle');

addpath([pwd '/callback']); % Callbacks for Control Panel
addpath([pwd '/basic-interface']); % Functions for base interface
addpath([pwd '/interface']); % Functions for interface
addpath([pwd '/stratonovich']); % Class of integral solution of Stratonovich equation
addpath([pwd '/kalman']); % Classes of Kalman filters

MW = CMainWindow('Multiantennas receiver');
if MW.handle == 0
    clear MW;
    return;
end

interface;

