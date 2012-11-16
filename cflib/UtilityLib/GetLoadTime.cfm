function GetLoadTime(mes,beg) {
	var measurement = 0;
	var measure_text = "";
	var tickBeginValue = 0;
	var tickEnd = 0;
	var loadTime = "";

	if (mes eq "mil") {
		measurement = 1;
		measure_text = " Milliseconds";
	}
	else if (mes eq "sec") {
		measurement = 1000;
		measure_text = " Seconds";
	}
	tickBeginValue = beg;
	tickEnd = gettickcount();
	loadTime = ((tickEnd - tickBeginValue)/measurement) & measure_text;
	return loadTime;
}