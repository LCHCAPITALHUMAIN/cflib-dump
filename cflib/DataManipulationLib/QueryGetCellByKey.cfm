function QueryGetCellByKey(theQuery, keyField, keyFieldValue, columnName){
	var key_field_value_list  = Evaluate("ValueList(theQuery.#keyField#)");
	var row_number            = ListFindNoCase(key_field_value_list, keyFieldValue);

	return theQuery[columnName][row_number];

}