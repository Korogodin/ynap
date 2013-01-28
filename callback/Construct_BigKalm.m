Dest0 = [D_extr_psi1 0;
             0                D_extr_psi2];
X0 = [0; 0];
BigKalm = CKalmanUdHess(X0, Dest0, F, G, Dksi);

global BigKRes
BigKRes.X = cell(1, nx);
BigKRes.X{1} = nan(1, K);
BigKRes.X{2} = nan(1, K);
BigKRes.ud = zeros(1, K);
BigKRes.ErrX1 = zeros(1, K);