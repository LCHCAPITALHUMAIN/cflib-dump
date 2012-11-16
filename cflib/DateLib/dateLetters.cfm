function dateLetters(dateStr) {
	var letterList="st,nd,rd,th";
	var domStr=DateFormat(dateStr,"d");
	var domLetters='';
	var formatStr = "";

	if(arrayLen(arguments) gte 2) formatStr = dateFormat(dateStr,arguments[2]);

	switch (domStr) {
		case "1": case "21": case "31":  domLetters=ListGetAt(letterList,'1'); break;
		case "2": case "22": domLetters=ListGetAt(letterList,'2'); break;
		case "3": case "23": domLetters=ListGetAt(letterList,'3'); break;
		default: domLetters=ListGetAt(letterList,'4');
	}

	return domStr & domLetters & " " & formatStr;
}