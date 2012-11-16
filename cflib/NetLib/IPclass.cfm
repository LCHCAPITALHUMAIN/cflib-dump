function IPclass(ip) {
	var myint = listFirst(ip, ".");
	if (myint GTE 1 and myint LTE 127) return "Class A";
	if (myint GTE 128 and myint LTE 191) return "Class B";
	if (myint GTE 192 and myint LTE 223) return "Class C";
	if (myint GTE 224 and myint LTE 239) return "Class D";
	if (myint GTE 240 and myint LTE 255) return "Class E";
}