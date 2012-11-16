function LatLonForCourseAndDistance(lat1,lon1,tc,d) {
	var lat = 1;
	var lon = 1;

	tc = tc * pi() / 180;
	d = d * pi()/(180*60);
	lat1 = lat1 * pi()/180;
	lon1 = lon1 * pi()/180;  
	lat = asin(sin(lat1)*cos(d)+cos(lat1)*sin(d)*cos(tc));
  
	if (abs(lat) IS pi()/2) lon = lon1;
	else lon = properMod(lon1-asin(sin(tc)*sin(d)/cos(lat))+pi(),2*pi()) - pi() ;

	lat = lat * 180/pi();
	lon = lon * 180/pi();
	
	return lat & "," & lon;
}