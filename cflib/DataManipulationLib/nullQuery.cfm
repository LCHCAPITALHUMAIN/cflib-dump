function nullQuery(q,Fields,Values) {
	var i=0;
	var NewQ=QueryNew(Replace(Fields,"|",",","ALL"));
	if (q.RecordCount GT 0) return q;
	QueryAddRow(NewQ);
	for(i=1; i LTE ListLen(Fields,'|'); i=i+1) {
		querySetCell(NewQ,ListGetAt(Fields,i,'|'),ListGetAt(Values,i,'|'));
	}
	return NewQ;
}