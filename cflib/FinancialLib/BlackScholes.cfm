function BlackScholes (call_put_flag,S,X,T,r,v) {
    var d1 = ( log(S / X) + (r + (v^2) / 2) * T ) / ( v * (T^0.5) );
    var d2 = d1 - v * (T^0.5);

    if (call_put_flag eq 'c')
        return S * CND(d1) - X * exp( -r * T ) * CND(d2);
    else
        return X * exp( -r * T ) * CND(-d2) - S * CND(-d1);
}