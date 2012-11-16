function reCompile(required String regex, flags) {
	var pattern = createObject("java","java.util.regex.Pattern");
		
	if (isNull(flags))
		local.compiled = pattern.compile(regex);
	else {
		if (isSimpleValue(flags))
			flags = listToArray(flags);
	
		var flagInt = 0;
			
		for (local.flagName in flags)
			flagInt += pattern[flagName];
			
		local.compiled = pattern.compile(regex, javacast("int", flagInt));
	}
		
	return local.compiled;
}