string function solrClean(required string input){
	var cleanText = trim(arguments.input);
	// List of bad charecters. "+ - && || ! ( ) { } [ ] ^ " ~ * ? : \" 
	// http://lucene.apache.org/core/3_6_0/queryparsersyntax.html#Escaping Special Characters
	var reBadChars = "\+|-|&&|\|\||!|\(|\)|{|}|\[|\]|\^|\""|\~|\*|\?|\:|\\";
	
	// Replace comma with OR
	cleanText = replace(cleanText, "," , " or " , "all");

	// Strip bad characters
	cleanText = reReplace(cleanText, reBadChars, " ", "all");

	// Clean up sequences of space characters
	cleanText = reReplace(cleanText, "\s+", " ", "all");

    // clean up wildcard characters as first characters
    cleanText = reReplace(cleanText, "(^[\*\?]{1,})", "");

	// uCaseWords - and=AND, etc - lcase rest. if keyword is mixed case - solr treats as case-sensitive!
	cleanText = uCaseWordsForSolr(cleanText);
	return trim(cleanText);
}