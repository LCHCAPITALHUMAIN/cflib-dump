function nBase36(num){
	var stream = chr(32);
	var chars = "0123456789abcdefghijklmnopqrstuvwxyz";
	var res = "";
	if (num GT 0) { 
		while (num GT 0) {
			res = num - 36 * int(num / 36);
			num = int(num / 36);
			stream = mid(chars,res + 1,1) & stream;
		}
	} else {
		stream = num;
	}
	return(stream);
}