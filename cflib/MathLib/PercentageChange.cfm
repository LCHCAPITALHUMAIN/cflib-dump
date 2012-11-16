function PercentageChange(var1,var2){			
	var maxNumber = max(var1,var2);
	var minNumber = min(var1,var2);
	var change = maxNumber - minNumber;
	var symbol = "";
		
	if (var1 EQ var2)   return 0;
	change = NumberFormat(change / var1 * 100, 0.00);	
	
	if(var1 GT var2) symbol = "-";
	else symbol = "+";

	return symbol & " " & change;	
}