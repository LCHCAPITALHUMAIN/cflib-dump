function hyQuantile(qtil, range) {
	var rangeArr = ListToArray(range);
	var hyqtil = "";
 	var nrofelms = "";
 	var nrofsteps = "";
	var percpos = "";
	var percpos1 = "";
 	var percpos2 = "";
	var rP1 = "";
	var rP2 = "";
	var deltarp = "";
	var wfactor = "";
	var deltarp_v = "";

	qtil = qtil * 0.01;
	arraySort(rangeArr, "numeric");
  
	nrofelms = arrayLen(rangeArr);
	nrofsteps = qtil * (nrofelms - 1);
	
	if(int(nrofsteps) eq nrofsteps) {
		percpos = nrofsteps + 1;
		hyqtil = rangeArr[percpos];
    } else {
		percpos1 = Int(nrofsteps) + 1;
		percpos2 = percpos1 + 1;
		rP1 = rangeArr[percpos1];
		rP2 = rangeArr[percpos2];
		deltarp = rP2 - rP1;
		wfactor = nrofsteps - (Int(nrofsteps));
		deltarp_v = deltarp * wfactor;
		hyqtil = rP1 + deltarp_v;
	}
	return hyqtil;
}