function mX = SpdToVecs(XX, mMean)

    Symm = @(M) (M + M') / 2;

    if nargin < 2
        mMean = SpdMean(XX);
    end
    
    mInvSqrtMean = inv(sqrtm(mMean));
    
    K  = length(XX);
    D  = size(XX{1}, 1);
    D2 = D * (D + 1) / 2;
    mX = zeros(D2, K);
    
    mW = sqrt(2) * ones(D) - (sqrt(2) - 1) * eye(D);
    for kk = 1 : K
        Skk      = logm(Symm(mInvSqrtMean * XX{kk} * mInvSqrtMean)) .* mW;
        mX(:,kk) = Skk(triu(true(size(Skk))));
    end
   
end