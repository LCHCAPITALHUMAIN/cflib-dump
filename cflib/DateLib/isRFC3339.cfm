function isRFC3339(input) {
	return YesNoFormat(REFindNoCase('^(19|20)\d\d-(0[1-9]|1[0-2])-([0-2]\d|3[0-1])T([0-1]\d|2[0-4]):([0-5]\d):([0-5]\d)(.\d\d)?(Z|[\+|-]([0-1]\d|2[0-4]):([0-5]\d))$',input));
}