function RomanFormat(DecIn) {

/* declare variables */
var RomOut = ""; // string to be returned
var RomList = "M,D,C,L,X,V,I"; // list of roman numerals
var DecList = "1000,500,100,50,10,5,1"; // list of equivalents to roman numerals

/* variables used in looping */
var i = 1;
var j = 1; 

/* implement the subtraction rule by converting the in strings to the out strings later */
var RomReplaceInList = "DCCCC,CCCC,LXXXX,XXXX,VIIII,IIII";
var RomReplaceOutList = "CM,CD,XC,XL,IX,IV";

/* convert lists to arrays for easier access */
var RomArray = ListToArray(RomList);
var DecArray = ListToArray(DecList);
var RomReplaceInArray = ListToArray(RomReplaceInList);
var RomReplaceOutArray = ListToArray(RomReplaceOutList);

/* hack off the decimal part of the incoming argument */
DecIn = int(DecIn);

/* generate the raw Roman string */
i = 1;
while (DecIn GT 0) {
	if (DecIn - DecArray[i] GTE 0) {
		DecIn = DecIn - DecArray[i];
		RomOut = RomOut & RomArray[i];
		} else {
		i = i + 1;
	}
}

/* apply the subtraction rule to the raw Roman string */
for (j = 1; j LTE ArrayLen(RomReplaceInArray); j = j + 1) {
	RomOut = Replace(RomOut, RomReplaceInArray[j], RomReplaceOutArray[j]);
}

return RomOut;
}