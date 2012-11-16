function TrailingZeroes(inNum, decPlaces){
	var existing_dec_places  = 0;

	if(decPlaces GT 0) {
		if(inNum contains "."){
			existing_dec_places = Len(ListGetAt(inNum, 2, "."));
			if(existing_dec_places LT decPlaces){
				return inNum & RepeatString("0", decPlaces - existing_dec_places);
			}
		} else {
			// was shortened to an integer without a decimal point
			return inNum & "." & RepeatString("0", decPlaces - existing_dec_places);
		}
	}
	return inNum;
}