/**
 * Returns the interest rate per period of an annuity. 
 * RATE is calculated by iteration and can have zero or more solutions.
 * 
 * excelRate(nper,pmt,pv,fv,type,guess)
 * @param nper  |   
 * @param pmt  |   
 * @param pv  |   
 * @param fv  |    OPTIONAL 
 * @param type  |    OPTIONAL 
 * @param guess  |    OPTIONAL 
 * @return  |  A numeric value. 
 * @author  |  Bret Feddern (bret@bricecheddarn.com) 
 * @version 1 - February 19, 2012 
 */

function excelRate(nper, pmt, pv) {

	var financialPrecision = 1.0e-08;
	var maxIterations = 128;
	var fv = 0.0;
	var type = 0; 
	var guess = 0.1;
	var rate = '';
	var f = '';
	var i = '';
	var y = '';
	var y0 = '';
	var y1 = '';
	var x0 = '';
	var x1 = '';
	
	if (ArrayLen(arguments) GT 3) {
		fv = arguments[4];
	}
	
	if (ArrayLen(arguments) GT 4) {
		type = arguments[5];
	}
	
	if (ArrayLen(arguments) GT 5) {
		guess = arguments[6];
	}
	
	rate = guess;
		
	if (abs(rate) lt financialPrecision) {
		y = arguments.pv * (1 + arguments.nper * rate) + arguments.pmt * (1 + rate * type) * arguments.nper + fv;
	} else {
		f = exp(arguments.nper * log(1 + rate));
		y = arguments.pv * f + arguments.pmt * (1 / rate + type) * (f - 1) + fv;
	}
	
	y0 = arguments.pv + arguments.pmt * arguments.nper + fv;
	y1 = arguments.pv * f + arguments.pmt * (1 / rate + type) * (f - 1) + fv;
	
	i = 0.0;
	x0 = 0.0;
	x1 = rate;
	
	while ((abs(y0 - y1) GT financialPrecision) AND (i LT maxIterations)) {
        rate = (y1 * x0 - y0 * x1) / (y1 - y0);
		x0 = x1;
		x1 = rate;
  
		if (abs(rate) LT financialPrecision) {
			y = arguments.pv * (1 + arguments.nper * rate) + arguments.pmt * (1 + rate * type) * arguments.nper + fv;
		} else {
			f = exp(arguments.nper * log(1 + rate));
			y = arguments.pv * f + arguments.pmt * (1 / rate + type) * (f - 1) + fv;
		}
		 
		y0 = y1;
		y1 = y;  
        i = i++;
     }
	
	return(rate);
}