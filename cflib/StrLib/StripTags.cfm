function stripTags(stripmode,mytags,mystring) {
	var spanquotes = "([^"">]*""[^""]*"")*";
	var spanstart = "[[:space:]]*/?[[:space:]]*";
	var endstring = "[^>$]*?(>|$)";
	var x = 1;
	var currenttag = structNew();
	var subex = "";
	var findonly = false;
	var cfversion = iif(structKeyExists(GetFunctionList(),"getPageContext"), 6, 5);
	var backref = "\\1"; // this backreference works in cf 5 but not cf mx
	var rexlimit = len(mystring);

	if (arraylen(arguments) gt 3) { findonly = arguments[4]; }
	if (cfversion gt 5) { backref = "\#backref#"; } // fix backreference for mx and later cf versions
	else { rexlimit = 19000; } // limit regular expression searches to 19000 characters to support CF 5 regex character limit

	if (len(trim(mystring))) {
		// initialize defaults for examining this string
		currenttag.pos = ListToArray("0");
		currenttag.len = ListToArray("0");

		mytags = ArrayToList(ListToArray(mytags)); // remove any empty items in the list
		if (len(trim(mytags))) {
			// turn the comma delimited list of tags with * as a wildcard into a regular expression
			mytags = REReplace(mytags,"[[:space:]]","","ALL");
			mytags = REReplace(mytags,"([[:punct:]])",backref,"ALL");
			mytags = Replace(mytags,"\*","[^$>[:space:]]*","ALL");
			mytags = Replace(mytags,"\,","[$>[:space:]]|","ALL");
			mytags = "#mytags#[$>[:space:]]";
		} else { mytags = "$"; } // set the tag list to end of string to evaluate the "allow nothing" condition

		// loop over the string
		for (x = 1; x gt 0 and x lt len(mystring); x = x + currenttag.pos[1] + currenttag.len[1] -1)
		{ 
			// find the next tag within rexlimit characters of the starting point
			currenttag = REFind("<#spanquotes##endstring#",mid(mystring,x,rexlimit),1,true); 
			if (currenttag.pos[1])
			{ 
				// if a tag was found, compare it to the regular expression
				subex = mid(mystring,x + currenttag.pos[1] -1,currenttag.len[1]); 
				if (stripmode is "allow" XOR REFindNoCase("^<#spanstart#(#mytags#)",subex,1,false) eq 1)
				{
					if (findonly) { return subex; } // return invalid tag as an error message
					else { // remove the invalid tag from the string
						myString = RemoveChars(myString,x + currenttag.pos[1] -1,currenttag.len[1]);
						currenttag.len[1] = 0; // set the length of the tag string found to zero because it was removed
					}
				}
			}
			// no tag was found within rexlimit characters
			// move to the next block of rexlimit characters -- CF 5 regex limitation
			else { currenttag.pos[1] = rexlimit; }
		}
	}
	if (findonly) { return ""; } // return an empty string indicating no invalid tags found
	else { return mystring; } // return the new string discluding any invalid tags
}