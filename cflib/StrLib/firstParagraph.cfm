function firstParagraph(str) {
	str = trim(str);
	endTag = findNoCase("</p>", str);
	if (endTag gt 0) {
		endTag = endTag + 3;
		extract = left(str, endTag);
	} else {
		extract = str;
	}
	return extract;
}