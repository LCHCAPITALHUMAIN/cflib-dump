function journeyCost(miles,mpg,ppl) {
	var litresInGallon = 4.54;
	var cost = ( miles / mpg ) * litresInGallon * ( ppl / 100 );
	return decimalFormat(cost);
}