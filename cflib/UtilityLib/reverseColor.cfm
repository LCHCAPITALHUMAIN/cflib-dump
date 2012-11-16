function reverseColor(startingColor) {
	var start = InputBaseN(startingColor, 16);
	var red = InputBaseN("FF", 16);
	var green = InputBaseN("FF00", 16);
	var blue = InputBaseN("FF0000", 16);
	var tmp = "";

	invertRed = BitAnd(BitXOR(start, red), red);
	invertGreen = BitAnd(BitXOR(start, green), green);
	invertBlue = BitAnd(BitXOR(start, blue), blue);

	tmp = invertRed + invertGreen + invertBlue;
	tmp = Ucase(FormatBaseN(tmp, 16));
	if(len(tmp) is 4) tmp = "00" & tmp;

	return tmp;
}