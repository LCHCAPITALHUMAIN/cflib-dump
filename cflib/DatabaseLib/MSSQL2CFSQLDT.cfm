function MSSQL2CFSQLDT (DataType) {
	var MSSQLType = 'int,bigint,smallint,tinyint,numeric,money,smallmoney,bit,decimal,float,real,datetime,smalldatetime,char,nchar,varchar,nvarchar,text,ntext';
	var CFSQLType = 'CF_SQL_INTEGER,CF_SQL_BIGINT,CF_SQL_SMALLINT,CF_SQL_TINYINT,CF_SQL_NUMERIC,CF_SQL_MONEY4,CF_SQL_MONEY,CF_SQL_BIT,CF_SQL_DECIMAL,CF_SQL_FLOAT,CF_SQL_REAL,CF_SQL_TIMESTAMP,CF_SQL_DATE,CF_SQL_CHAR,CF_SQL_CHAR,CF_SQL_VARCHAR,CF_SQL_VARCHAR,CF_SQL_LONGVARCHAR,CF_SQL_LONGVARCHAR';
	
	if(ListFind(MSSQLType,DataType)) {
		return ListGetAt(CFSQLType,ListFind(MSSQLType,DataType));
	} else { return 'NULL'; }
}