function totalTimeFromSec(seconds)
{
	Var xHr = (seconds\3600); // find hour 
	Var xMin = (seconds\60) - (xHr*60); // Find minutes
	Var xSec = seconds - (xHr * 3600) - (xMin*60); // find seconds
	var xTime = "#NumberFormat(xHr,'00')#:#NumberFormat(xMin,'00')#:#NumberFormat(xSec,'00')#"; //return in time format
	return xTime;
}