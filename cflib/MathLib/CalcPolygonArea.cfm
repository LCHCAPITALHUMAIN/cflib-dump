function CalcPolygonArea(data) {
	var area = "0";
	var i = 1;

	// Check for valid Stucture with at least 3 records
	if(not isArray(data) or arrayLen(data) lte 2) return 0;
	
	data[arrayLen(data)+1] = structNew();
	data[arrayLen(data)].x = data[1].x;
	data[arrayLen(data)].y = data[1].y;
	

	// Loop through the structure performing the area calculation.
	// Formula = Area = 1/2 * ((x1+x2)(y1-y2)+(x2+x3)(y2-y3)+...+(xn+x1)(yn-y1))
	for(; i LT arrayLen(data) ; i=i+1) {
		area = area + ( data[i+1].x-data[i].x) * (data[i+1].y + data[i].y) / 2;
	}
	
	// Only return positive values.
	return abs(area);
}