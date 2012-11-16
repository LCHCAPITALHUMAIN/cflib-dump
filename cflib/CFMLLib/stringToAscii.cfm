function stringToAscii(str) {
	var local = StructNew();
	local.oldStr = '';
	local.newStr = '';
	if ( StructKeyExists(arguments, 'str') and IsSimpleValue(arguments.str) ) {
		local.oldStr = arguments.str;
		for ( local.i=1; local.i lte Len(arguments.str); local.i++ ) {
			local.newStr = local.newStr & '&##' & Asc(Left(local.oldStr,1)) & ';';
			local.oldStr = RemoveChars(local.oldStr,1,1);
		};
	};
	return local.newStr;
};