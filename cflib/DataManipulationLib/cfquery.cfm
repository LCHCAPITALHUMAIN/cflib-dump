function cfquery(dsn,col,sql) {
    var datasource = dsn;    
    var userName = "";
    var password = "";
    var adOpenStatic = 3;
    var adLockReadOnly=1;
    var adCmdTxt = 1;
    var adGetRowsRest = -1;
    var columns = listToArray(col); 
    var strSQL = sql;
    var objDataConn = CreateObject("COM", "ADODB.Connection");
    var objDataRst = "";
    var intRecordCount = "";
    var arrRst = "";
    var qry = queryNew(arrayToList(columns));
    var thisCol = "";
    var thisRow = "";

    objDataConn.Open(Datasource, userName, password, -1);
    objDataRst = CreateObject("COM", "ADODB.Recordset");
    objDataRst.open(strSQL, objDataConn, adOpenStatic, adLockReadOnly, adCmdTxt);  
    intRecordCount = objDataRst.RecordCount;
    arrRst = objDataRst.GetRows(adGetRowsRest);
	
    queryAddRow(qry,intRecordCount);
    for (thisCol=1; thisCol LTE arrayLen(columns); thisCol=thisCol+1) {
        for (thisRow=1; thisRow LTE arrayLen(arrRst[thisCol]); thisRow=thisRow+1) {
	    querySetCell(qry,columns[thisCol],arrRst[thisCol][thisRow],thisRow);
	}
    }
    objDataRST.close();
    objDataConn.close();
    return qry;
}