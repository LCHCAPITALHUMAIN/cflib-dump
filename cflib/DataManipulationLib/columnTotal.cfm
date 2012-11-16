function columnTotal(qryColumn){
	return arraySum(listToArray(evaluate("valueList(" & qryColumn & ")")));
}