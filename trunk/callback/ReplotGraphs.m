retu = 0;
try 
    MW.replot();
    tfromstart = toc(t_start);
    set(h_timer, 'String', num2str(tfromstart));
catch err
    if strcmp(err.identifier, 'MATLAB:class:InvalidHandle')
        disp('Form is closed');
        retu = 1;
        return
    else
        rethrow(err);
    end
end