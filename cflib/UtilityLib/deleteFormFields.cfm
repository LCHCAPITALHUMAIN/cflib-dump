function deleteFormFields(fieldList) {
	var listIndex = 1;
	var i = 1;
	fieldList = ListToArray(fieldList);
	for(i = 1; i lte ArrayLen(fieldList); i = i + 1) {
		StructDelete(form, fieldList[i]);
		listIndex = ListFindNoCase(form.fieldnames, fieldList[i]);
		form.fieldnames = ListDeleteAt(form.fieldnames, listIndex);
	}
}