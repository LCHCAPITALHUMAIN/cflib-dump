function Indent(str) {
	var chri = CHR(9); // indenting character. Defaults to horizontal tab
	var ncnt = 1; // strIndent = RepeatString(ichr, ncnt)
	var strcr = CHR(13);
	var strlf = CHR(10);
	var strcrlf = strcr & strlf;
	var strIndent = "";
	if (ArrayLen(Arguments) GT 1) {
		chri = Arguments[2];
		if (ArrayLen(Arguments) GT 2) {
			ncnt = Arguments[3];
		}
	}
	strIndent = RepeatString(chri, ncnt);
	return (strIndent & REReplace(str, "([#strcrlf#]+)([^#strcrlf#])", "\1#strIndent#\2", "ALL"));
}