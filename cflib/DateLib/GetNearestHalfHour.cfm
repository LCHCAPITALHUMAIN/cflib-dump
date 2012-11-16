function GetHalfHour(minutes) {
  var min_diff = abs(30 - minutes);
  var half_hour = 0;
  if (minutes lte 30) {
    if (min_diff gte 15) { half_hour = "00"; }
	else { half_hour = "30"; }
  } 
  else if (minutes gt 30) {
    if (min_diff gte 15) { half_hour = "00"; }
	else { half_hour = "30"; }
  }
  return half_hour;
}