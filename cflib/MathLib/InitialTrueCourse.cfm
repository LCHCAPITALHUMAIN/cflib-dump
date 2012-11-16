function InitialTrueCourse(lat1,lon1,lat2,lon2)
{
  // Check to make sure latitutdes and longitudes are valid
  if(lat1 GT 90 OR lat1 LT -90 OR
     lon1 GT 180 OR lon1 LT -180 OR
     lat2 GT 90 OR lat2 LT -90 OR
     lon2 GT 280 OR lon2 LT -280) {
    Return ("Incorrect parameters");
  }
     
  // Calculate distance betweent the two points in radians
  d = LatLonDist(lat1,lon1,lat2,lon2,'radians');


  // Convert latitudes and longitudes to radians and set truc course to zero
  lat1 = lat1 * pi()/180;
  lon1 = lon1 * pi()/180;
  lat2 = lat2 * pi()/180;
  lon2 = lon2 * pi()/180;
  tc1 = 0;  
  
  // Handle the special cases of starting at the poles 
  if(lat1 IS pi()/2)
       Return ( 180 );    //  starting from noth pole
  if(lat1 IS -1*pi()/2)
       Return ( 360 );  //  starting from south pole

  
  if (sin(lon2 - lon1) LT 0)
    tc1 = acos((sin(lat2)-sin(lat1)*cos(d))/(sin(d)*cos(lat1)));
  else
    tc1 = 2*pi()-acos((sin(lat2)-sin(lat1)*cos(d))/(sin(d)*cos(lat1)));  

  Return ( tc1 * 180/pi() );
}