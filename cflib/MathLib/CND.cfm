function CND (x) {
    // The cumulative normal distribution function
    var Pi = 3.141592653589793238;
    var a1 = 0.31938153;
    var a2 = -0.356563782;
    var a3 = 1.781477937;
    var a4 = -1.821255978;
    var a5 = 1.330274429;
    var L = abs(x);
    var k = 1 / ( 1 + 0.2316419 * L);
    var p = 1 - 1 /  ((2 * Pi)^0.5) * exp( -(L^2) / 2 ) * (a1 * k + a2 * (k^2) + a3 * (k^3) + a4 * (k^4) + a5 * (k^5) );

    if (x gte 0)
        return p;
    else
        return 1-p;

}