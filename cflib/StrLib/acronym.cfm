function acronym(sTerms) {
	return '<acronym title="' & sTerms & '">' & trim( reReplaceNoCase( " " & sTerms & " ", "(\w)\w+\s", "\1", "all" ) ) & '</acronym>';
}