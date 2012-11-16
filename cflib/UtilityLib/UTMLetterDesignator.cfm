function UTMLetterDesignator(lat){
	var UTMLetter = "Z";
			
	if(84 GTE lat AND lat GTE 72) UTMLetter = "X";
	else if(72 GT lat AND lat GTE 64) UTMLetter = "W";
	else if(64 GT lat AND lat GTE 56) UTMLetter = "V";
	else if (56 GT lat AND lat GTE 48) UTMLetter = "U";
	else if (48 GT lat AND lat GTE 40) UTMLetter = "T";
	else if (40 GT lat AND lat GTE 32) UTMLetter = "S";
	else if (32 GT lat AND lat GTE 24) UTMLetter = "R";
	else if (24 GT lat AND lat GTE 16) UTMLetter = "Q";
	else if (16 GT lat AND lat GTE 8) UTMLetter = "P";
	else if (8 GT lat AND lat GTE 0) UTMLetter = "N";
	else if (0 GT lat AND lat GTE -8) UTMLetter = "M";
	else if (-8 GT lat AND lat GTE -16) UTMLetter = "L";
	else if (-16 GT lat AND lat GTE -32) UTMLetter = "K";
	else if (-32 GT lat AND lat GTE -40) UTMLetter = "J";
	else if (-40 GT lat AND lat GTE -48) UTMLetter = "H";
	else if (-48 GT lat AND lat GTE -56) UTMLetter = "G";
	else if (-56 GT lat AND lat GTE -64) UTMLetter = "F";
	else if (-64 GT lat AND lat GTE -72) UTMLetter = "E";
	else if (-72 GT lat AND lat GTE -80) UTMLetter = "C";
	return UTMLetter;
}