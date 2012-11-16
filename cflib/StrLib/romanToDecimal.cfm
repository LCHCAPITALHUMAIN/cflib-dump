function romantodec(input) {
	var romans = {};
	var result = 0;
	var pos = 1;
	var char = "";
	var thisSum = "";
	var nextchar = "";
	var subSum = 0;
		
	romans["I"] = 1;
	romans["V"] = 5;
	romans["X"] = 10;
	romans["L"] = 50;
	romans["C"] = 100;
	romans["D"] = 500;
	romans["M"] = 1000;

	while(pos lte len(input)) {
		char = mid(input, pos, 1);
		subSum += romans[char];
		if(pos != len(input)) {
			nextchar = mid(input, pos + 1, 1);
			if(romans[char] == romans[nextchar]) {
				pos++;
			} else if(romans[char] < romans[nextchar]) {
				result = result + romans[nextchar] - subSum;
				subSum = 0;
				pos += 2;
			} else {
				result = result + subSum;
				subSum = 0;
				pos++;
			}
		} else {
			result = result + subSum;
			pos++;
		}
	}    
	return result;
}