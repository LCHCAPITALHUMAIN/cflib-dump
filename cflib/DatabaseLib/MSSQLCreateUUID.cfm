function MSSQL_createUUID(){
	var format = 'string';
	// uniqueidentifier wombat_createUUID([string FORMAT])
	//returns a UUID in the format specified.  
	//optional argument FORMAT defaults to string (MS-SQL uniqueidentifier safe)
	//accepts 'binary' or 'string'.  other values fail quietly to 'string'
	
	
	if(arraylen(Arguments)){
		if(arguments[1] eq 'binary' or arguments[1] eq 'string'){
			format = arguments[1];
		}
	}
	
	if(format eq 'string'){
		return Insert("-", CREATEuuid(), 23);
		/***   NOTE quoted usage is SQL statement:
		Insert into attribute (attributeID) values ('#wombat_createUUID()#')
		***/
	
	}else{//must be raw binary
		return '0x' & Replace(CREATEuuid(),'-','','All'); 
		/***   NOTE UN-quoted usage is SQL statement:
		Insert into attribute (attributeID) values (#wombat_createUUID('binary')#)
		Good for cases where the value maybe either NULL or a UUID
		(neither of which should be quoted)
		***/
	}
}