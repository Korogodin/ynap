StratResults = CStratResults(K, 2, T);
StratResults.setP0(minpsi(1:2), maxpsi(1:2), dpsi(1:2), pest);
% if qcno_dB > 30
    StratResults.setLogMode(1);
% else
%     StratResults.setLogMode(0);
% end
