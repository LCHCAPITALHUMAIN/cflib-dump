function KBytes(bytes) {
	var b=0;

	if(arguments.bytes lt 1024) return trim(numberFormat(arguments.bytes,"9,999")) & " bytes";
	
	b=arguments.bytes / 1024;
	
	if (b lt 1024) {
		if(b eq int(b)) return trim(numberFormat(b,"9,999")) & " KB";
		return trim(numberFormat(b,"9,999.9")) & " KB";
	}
	b= b / 1024;
	if (b eq int(b)) return trim(numberFormat(b,"999,999,999")) & " MB";
	return trim(numberFormat(b,"999,999,999.9")) & " MB";
}