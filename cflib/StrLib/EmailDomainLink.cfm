function emailDomainLink(theEmailAddress) {
	var this_username  = listFirst(theEmailAddress, "@");
	var this_domain    = listLast(theEmailAddress, "@");
	var theTarget      = "";
	if(arrayLen(arguments) gte 2) theTarget = arguments[2];
	if(Len(theTarget) GT 0) return "#this_username#@<a href=""http://www.#this_domain#"" target=""#theTarget#"">#this_domain#</a>";
	else return "#this_username#@<a href=""http://www.#this_domain#"">#this_domain#</a>";
}