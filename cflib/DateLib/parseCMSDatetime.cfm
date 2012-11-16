function parseCMSDatetime(cmsDatetime) {
	// Replace all /'s that CVS uses with -'s
	return LSParseDatetime(replace(listGetAt(arguments.cmsDatetime, 2, " "), "/", "-", "ALL") & " " & listGetAt(arguments.cmsDatetime, 3, " "));
}