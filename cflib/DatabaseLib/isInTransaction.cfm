function isInTransaction(){
	var result = createObject("java", "coldfusion.tagext.sql.TransactionTag").getCurrent();
	return structKeyExists(local, "result");
}