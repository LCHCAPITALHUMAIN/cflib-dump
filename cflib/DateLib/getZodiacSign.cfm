function getZodiacSign(date) {
	var bday_m = month(date);
	var bday_d = day(date);
	
	switch(bday_m) {
		case 1: 
			if (bday_d LTE 20) { sign = "Capricorn"; } else { sign = "Aquarius"; }
			break;
		case 2: 
			if (bday_d LTE 19) { sign = "Aquarius"; } else { sign = "Pisces"; }
			break;
		case 3: 
			if (bday_d LTE 20) { sign = "Pisces"; } else { sign = "Aries"; }
			break;
		case 4:
			if (bday_d LTE 20) { sign = "Aries"; } else { sign = "Taurus"; }
			break;
		case 5: 
			if (bday_d LTE 21) { sign = "Taurus"; } else { sign = "Gemini";	}
			break;
		case 6: 
			if (bday_d LTE 22) { sign = "Gemini"; } else { sign = "Cancer";	}
			break;
		case 7: 
			if (bday_d LTE 23) { sign = "Cancer"; } else { sign = "Leo"; }
			break;
		case 8: 
			if (bday_d LTE 23) { sign = "Leo"; } else { sign = "Virgo"; }
			break;
		case 9: 
			if (bday_d LTE 23) { sign = "Virgo"; } else { sign = "Libra"; }
			break;
		case 10: 
			if (bday_d LTE 23) { sign = "Libra"; } else { sign = "Scorpio"; }
			break;
		case 11: 
			if (bday_d LTE 22) { sign = "Scorpio"; } else { sign = "Sagittarius"; }
			break;
		case 12: 
			if (bday_d LTE 21) { sign = "Sagittarius"; } else { sign = "Capricorn"; }
			break;
	}
	
	return sign;
}