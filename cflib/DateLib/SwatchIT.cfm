function swatchIT(){
	var myutc = GetTimeZoneInfo();
	var beats = ((3600 + Val(Hour(now()) * 3600) + Val(Minute(now()) * 60) + Second(now()) + val(myutc.utcTotalOffset)) mod 86400) / 86.4;
	return decimalformat(beats);
}