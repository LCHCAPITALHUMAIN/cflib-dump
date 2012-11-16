function DeleteClientVariables() {
	var ClientVarList = GetClientVariablesList();
	var safeList = "";
	var i = 1;

	if(ArrayLen(Arguments) gte 1) safeList = Arguments[1];

	for(i=1; i lte listLen(ClientVarList); i=i+1) {
		if(NOT ListFindNoCase(safeList, ListGetAt(ClientVarList, i )))  DeleteClientVariable(ListGetAt(ClientVarList, i));
	}
	return true;
}