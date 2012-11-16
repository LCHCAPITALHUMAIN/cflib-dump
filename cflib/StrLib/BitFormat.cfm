function BitFormat(num) {
	return (IIF(IsNumeric(Trim(arguments.num)) AND Trim(arguments.num) NEQ 0, 1, 0));
}