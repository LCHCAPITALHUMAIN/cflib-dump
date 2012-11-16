function getDistance(lat1, lon1, lat2, lon2, units = 'miles')
{
	// earth's radius. Default is miles.
	var radius = 3959;
	if (arguments.units EQ 'kilometers' )
		radius = 6371;
	else if (arguments.units EQ 'feet')
		radius = 20903520;
	
	var toRad = pi() / 180;
	var dLat = (lat2-lat1) * toRad;
	var dLon = (lon2-lon1) * toRad; 
	var a = sin(dLat/2)^2 + cos(lat1 * toRad) * cos(lat2 * toRad) * sin(dLon/2)^2; 
	var c = 2 * createObject("java","java.lang.Math").atan2(sqr(a), sqr(1-a));
	
	return radius * c;
}