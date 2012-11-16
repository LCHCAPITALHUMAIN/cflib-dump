function calculateUTMZone(lat,lon){
	// make sure the longitude is between -180 and 179.9
	var lonTemp = (arguments.lon + 180) - int((arguments.lon + 180) / 360) * 360 - 180;
	var zoneNumber = int((lonTemp + 180)/6) + 1;
			
	// Special zones for Svalbard
	if(arguments.lat GTE 72 and arguments.lat GT 84) {
		if(lonTemp GTE 0 AND lonTemp LT 9) zoneNumber = 31;
		else if(lonTemp GTE 9 AND lonTemp LT 21) zoneNumber = 33;
		else if(lonTemp GTE 21 AND lonTemp LT 33) zoneNumber = 35;
		else if(lonTemp GTE 33 AND lonTemp LT 42) zoneNumber = 37;
	}			
	return zoneNumber;
}