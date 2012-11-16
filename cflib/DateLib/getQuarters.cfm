function getQuarters(aYears){
	var aQuarters = ArrayNew(1);
	var yLen	  = ArrayLen(aYears);
	var q1Start = '01-01-';
	var q1End	= '03-31-';
	var q2Start	= '04-01-';
	var q2End	= '06-30-';
	var q3Start	= '07-01-';
	var q3End	= '09-30-';
	var q4Start	= '10-01-';
	var q4End	= '12-31-';
	var y = 1;
	var q = 1;
	
	for(;y lte yLen;y=y+1) {
		aQuarters[y] = StructNew();
		for(q=1;q lte 4;q=q+1) {
			if(q is 1) {
				if(q1Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q1 = q1Start & aYears[y] & "~" & q1End & aYears[y];
				}
			} else if(q is 2) {
				if(q2Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q2 = q2Start & aYears[y] & "~" & q2End & aYears[y];
				}
			} else if(q is 3) {
				if(q3Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q3 = q3Start & aYears[y] & "~" & q3End & aYears[y];
				}
			} else if(q is 4) {
				if(q4Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q4 = q4Start & aYears[y] & "~" & q4End & aYears[y];
				}
			}
		}
	}
	return aQuarters;
}