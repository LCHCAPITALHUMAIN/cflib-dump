function histogram(y) {
	// Declarations
	var m = ArrayNew(1);	// array of bin Midpoints
	var b = ArrayNew(1);	// array of bin Boundaries
	var n = ArrayNew(1);	// array of Number of points in each bin
	var x = ArrayNew(2);	// 2-d array containing m and n above (returned)
	var i=1; 
	var j=1; 
	// Size of y
	var len = arrayLen(y);
	// Set the default upper and lower limits and number of bins
	var miny = arrayMin(y);
	var maxy = arrayMax(y);
	var nbins = 10;
	var binwidth = 1;
	// Set the limits if not using the defaults
	if(arrayLen(arguments) gte 2) {
    	miny = arguments[2];
    	maxy = arguments[3];
    	nbins = arguments[4];
 	}
	// Set the bin width
	binwidth = (maxy - miny) / (nbins-1);
	// Set the bin midpoints
	for(i=1; i LTE nbins; i=i+1) {
		m[i] = miny + (binwidth * (i-1));
    }
	// Set the bin boundaries
	for(i=1; i LTE (nbins+1); i=i+1) {
		b[i] = miny - (binwidth / 2) + (binwidth * (i-1));
    }
	// Count the number in each bin
	for(i=1; i LTE nbins; i=i+1) {
		n[i] = 0;  
	}
	for(j=1; j LTE len; j=j+1) {
		for(i=1; i LTE nbins; i=i+1) {
			if(y[j] GTE b[i] AND y[j] LT b[i+1] ) 
			{
				n[i] = n[i] + 1;
			}
		}
    }
	for(i=1; i LTE nbins; i=i+1) 
	{  
		x[1][i] = m[i];  
		x[2][i] = n[i];  
	}
    return x;
}