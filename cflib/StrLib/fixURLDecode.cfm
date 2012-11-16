function fixURLDecode(string){
	return URLDecode(ReReplaceNoCase(string, "%([^A-F0-9{2}])", "%25\1", "ALL"));
}