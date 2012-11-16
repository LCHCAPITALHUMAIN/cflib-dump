function getQueryColumns(theQuery){
	if(isQuery(theQuery)) return arraytoList(theQuery.getMeta().getColumnLabels());
	else return '';
}