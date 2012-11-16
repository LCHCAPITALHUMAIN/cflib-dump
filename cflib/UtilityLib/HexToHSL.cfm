function HexToHSL(RGBTriplet) {
	// ref Foley and van Dam, Fundamentals of Interactive Computer Graphics
	
	var R = 0;
	var G = 0;
	var B = 0;
	var H = 0;
	var S = 0;
	var L = 0;
	var TidiedTriplet = Replace(RGBTriplet, "##", "", "ALL");
	var MinColor = 0;
	var MaxColor = 0;
	
	if ( ListLen(RGBTriplet) GT 1 ) {
		R = ListFirst(RGBTriplet);
		G = ListGetAt(RGBTriplet, 2);
		B = ListLast(RGBTriplet);
	}
	else {
		R = InputBaseN(Mid(TidiedTriplet, 1,2), 16) / 255;
		G = InputBaseN(Mid(TidiedTriplet, 3,2), 16) / 255;
		B = InputBaseN(Mid(TidiedTriplet, 5,2), 16) / 255;
	}	
		
	MinColor = Min(R, Min(G, B));
	MaxColor = Max(R, Max(G, B));
	L = (MaxColor + MinColor)/2;

	if ( MaxColor NEQ MinColor ) { // not grey
		if ( L LT 0.5 )
			S=(MaxColor-MinColor)/(MaxColor+MinColor);
		else
			S=(MaxColor-MinColor)/(2-MaxColor-MinColor);
		if ( R EQ MaxColor )
			H = (G-B)/(MaxColor-MinColor);
		if ( G EQ MaxColor )
			H = 2 + (B-R)/(MaxColor-MinColor);
		if ( B EQ MaxColor )
			H = 4 + (R-G)/(MaxColor-MinColor);
		H = H / 6;	
	}
	
	return "#H#,#S#,#L#";
}