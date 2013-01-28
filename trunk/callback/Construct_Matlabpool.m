matlabpool size;
size_m = ans;
if ~((ans == 8)||(ans == 4))
    try
        matlabpool close;
    end
    matlabpool;
end