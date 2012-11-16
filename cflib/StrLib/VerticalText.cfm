function VerticalText(text){
	//build an array of the characters in the string
	var arrText = arrayNew(1);
	//a variable for looping
	var ii = 1;
	//the len of the string
	var textLen = len(text);
	//resize the array the length of the string
	arrayResize(arrText,textLen);
	//loop through the length of the string, building the array
	for(ii = 1; ii LTE textLen; ii = ii + 1){
		arrText[ii] = mid(text,ii,1);
	}
	return arrayToList(arrText,"<br />");
}