function scientificFormat(n,m) {
	// init result var
	var result = "";
	// Create DecimalFormat object and initialize it with our mask.
	var df = createObject("java","java.text.DecimalFormat").init(m);
	// Create BigDecimal object and initialize it with our number.
	var bd = createObject("java","java.math.BigDecimal").init(n);
	// Format our number using our mask.
	result = df.format(bd);
	// Return results.
	return result;
}