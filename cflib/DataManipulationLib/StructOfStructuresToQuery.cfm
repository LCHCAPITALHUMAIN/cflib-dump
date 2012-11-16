function StructOfStructuresToQuery(theStruct, primaryKey){
	var primary_key_list   = StructKeyList(theStruct);
	var field_list         = StructKeyList(theStruct[ListFirst(primary_key_list)]);
	var num_rows           = ListLen(primary_key_list);
	var the_query          = QueryNew(primaryKey & "," & field_list);
	var primary_key_value  = "";
	var field_name         = "";
	var the_value          = "";
	var row                = 0;
	var col                = 0;

	for(row=1; row LTE num_rows; row=row+1) {
		QueryAddRow(the_query);
		primary_key_value = ListGetAt(primary_key_list, row);
		QuerySetCell(the_query, primaryKey, primary_key_value);
		for(col=1; col LTE ListLen(field_list); col=col+1) {
			field_name = ListGetAt(field_list, col);
			the_value  = theStruct[primary_key_value][field_name];
			QuerySetCell(the_query, field_name, the_value);
		}
	}

	return(the_query);
}