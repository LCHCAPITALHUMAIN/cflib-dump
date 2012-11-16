function QuerySetCellByKey(theQuery, keyField, keyFieldValue, columnName, newValue){
	var key_field_value_list  = Evaluate("ValueList(theQuery.#keyField#)");
	var row_number            = ListFindNoCase(key_field_value_list, keyFieldValue);
	querysetCell(theQuery,columnName,newValue,row_number);
}