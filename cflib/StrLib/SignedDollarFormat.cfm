function signedDollarFormat(amount) {
	var sign = "";
	if (amount gt 0) sign = "+";
	else if (amount lt 0) sign = "-";
	amount = sign & dollarFormat(amount);
	return reReplace(amount,"\(|\)","","ALL"); //get rid of parenthesis
}