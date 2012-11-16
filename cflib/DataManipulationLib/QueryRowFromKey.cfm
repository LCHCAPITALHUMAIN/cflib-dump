function QueryRowFromKey(theQuery, keyField, keyFieldValue){
	var key_field_value_list = Evaluate("ValueList(theQuery.#keyField#)");
	return ListFindNoCase(key_field_value_list, keyFieldValue);
}