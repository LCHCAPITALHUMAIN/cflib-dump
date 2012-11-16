function NormDist(x, mean, sd) {
    var res = 0.0;
    var x2 = 0.0;
    var oor2pi = 0.0;
    var t = 0.0;
	
    x2 = (x - mean) / sd;
    if (x2 eq 0) res = 0.5;
    else
    {
        oor2pi = 1/(sqr(2.0 * 3.14159265358979323846));
        t = 1 / (1.0 + 0.2316419 * abs(x2));
        t = t * oor2pi * exp(-0.5 * x2 * x2) 
             * (0.31938153   + t 
             * (-0.356563782 + t
             * (1.781477937  + t 
             * (-1.821255978 + t * 1.330274429))));
        if (x2 gte 0)
        {
            res = 1.0 - t;
        }
        else
        {
            res = t;
        }
    }
    return res;
}