function getCardType(cardNumber) {
	var CardType = "Unknown";
	var CardLength = Len(cardNumber);
	
	if ((CardLength eq 15) and (((Left(cardNumber, 2) is "34")) or ((Left(cardNumber, 2) is "37")))) CardType = "American Express";
	if ((CardLength eq 14) and (((Left(cardNumber, 3) gte 300) and (Left(cardNumber, 3) lte 305)) or (Left(cardNumber, 2) is "36") or (Left(cardNumber, 2) is "38"))) CardType =  "Diner's Club";
	if ((CardLength eq 16) and (Left(cardNumber, 4) is "6011")) CardType =  "Discover Card";
	if ((CardLength eq 16) and (Left(cardNumber, 2) gte 51) and (Left(cardNumber, 2) lte 55)) CardType =  "MasterCard";
	if (((CardLength eq 13) or (CardLength eq 16)) and (Left(cardNumber, 1) is "4")) CardType =  "Visa";
	
	return CardType;
}