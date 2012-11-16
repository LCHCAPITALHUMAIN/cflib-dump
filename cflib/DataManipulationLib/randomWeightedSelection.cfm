function randomWeightedSelection(weights, n){
	var seq = structKeyArray(weights);
	var totals = arrayNew(1);
	var runningtotal = 0;
	var selections = arrayNew(1);
	var s = 0;
	var i = 0;
	
	for(i=1; i lte arrayLen(seq); i=i+1){
		runningtotal = runningtotal + weights[seq[i]];
		arrayAppend(totals, runningtotal);
	}
	for(s=1; s lte n; s=s+1){
		r = rand()*runningtotal;
		for(i=1; i lte arrayLen(seq); i=i+1){
			if(totals[i] gt r){
				arrayAppend(selections,seq[i]);
				break;
			}
		}
	}
	
	return selections;
}