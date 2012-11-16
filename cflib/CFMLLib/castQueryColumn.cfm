function castQueryColumn(qry, column, datatype) {
	var columnData = arrayNew(1);
	var ii = "";
	var loop_len = arguments.qry.recordcount;
	var columnNames = arraytoList(arguments.qry.getMetaData().getColumnLabels());
	var qoq = new Query();
	var newQry = new Query();
	var javatype = '';
	
	datatype = lcase(datatype);

	if (Listfindnocase(columnNames, arguments.column) IS 0) {return arguments.qry;}

	switch(datatype){
		case "integer": {javatype = "int"; break;}
		case "bigint": {javatype = "long"; break;}
		case "decimal": {javatype = "BigDecimal"; break;}
		case "varchar": {javatype = "string"; break;}
		case "binary": {javatype = "byte"; break;}
		case "bit": {javatype = "boolean"; break;}
		default: {javatype = "string"; break;}
	}

	for (ii=1; ii lte loop_len; ii=ii+1) {
		if (isNull(arguments.qry[arguments.column][ii])) {
			arrayAppend(columnData, arguments.qry[arguments.column][ii]);
		} else if (listfindnocase("date,time", datatype) AND ISDate(arguments.qry[arguments.column][ii])) {	
			arrayAppend(columnData, parsedatetime(arguments.qry[arguments.column][ii]));	
		} else if (listfind("int,long,float,BigDecimal,string,byte,boolean", javatype)){
			arrayAppend(columnData, JavaCast(javatype, arguments.qry[arguments.column][ii]));	
		} else {
			arrayAppend(columnData, arguments.qry[arguments.column][ii]);	
		}
	}

  columnNames = ListDeleteAt(columnNames, Listfindnocase(columnNames, column));
  qoq.setAttributes(QoQsrcTable = arguments.qry);
  newQry = qoq.execute(sql="select #columnNames# from QoQsrcTable", dbtype="query");
  newQry = newQry.getResult();

  QueryAddColumn(newQry, column, datatype, columnData);

  return newQry;

}