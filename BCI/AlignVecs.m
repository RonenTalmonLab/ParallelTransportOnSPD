function mX1R = AlignVecs(mX1, mX2)

    [U1, ~] = svd(mX1);
    [U2, ~] = svd(mX2);
    
    vSign   = sign(sum(U1 .* U2));
    U1      = U1 .* vSign;
    
    mX1R    = U2 * U1' * mX1;
    
end