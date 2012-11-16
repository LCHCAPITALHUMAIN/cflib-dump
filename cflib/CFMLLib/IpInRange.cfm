function isIpInRange(start, end, ip)
	{
		var startArray = listtoarray(arguments.start, ".");
		var endArray = listtoarray(arguments.end, ".");
		var ipArray = listtoarray(arguments.ip, ".");
		var s = ((16777216 * startArray[1]) + (65536 * startArray[2]) + (256 * startArray[3]) + startArray[4]);
		var e = ((16777216 * endArray[1]) + (65536 * endArray[2]) + (256 * endArray[3]) + endArray[4]);
		var c = ((16777216 * ipArray[1]) + (65536 * ipArray[2]) + (256 * ipArray[3]) + ipArray[4]);
		
		return isvalid("range", c, s, e);
	}