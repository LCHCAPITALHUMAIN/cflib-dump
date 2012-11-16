function mpgcalc(journeyStart,journeyEnd,litres) {
	var litresInGallon = 4.54;
	
	var miles = journeyEnd - journeyStart;
	var gallons = litres/litresInGallon;
	var mpg = miles/gallons;
	return decimalFormat(mpg);
    
}