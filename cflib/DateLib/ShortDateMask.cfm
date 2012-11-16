function ShortDateMask() {
	var Locale = GetLocale();
	var LocaleList = "Dutch (Belgian),Dutch (Standard),English (Australian),English (Canadian),English (New Zealand),English (UK),English (US),French (Belgian),French (Canadian),French (Standard),French (Swiss),German (Austrian),German (Standard),German (Swiss),Italian (Standard),Italian (Swiss),Norwegian (Bokmal),Norwegian (Nynorsk),Portuguese (Brazilian),Portuguese (Standard),Spanish (Mexican),Spanish (Modern),Spanish (Standard),Swedish";
	var MaskList = "d/mm/yyyy,d-m-yyyy,d/mm/yyyy,,dd/mm/yyyy,d/mm/yyyy,dd/mm/yyyy,m/d/yyyy,d/mm/yyyy,yyyy-mm-dd,dd/mm/yyyy,dd.mm.yyyy,dd.mm.yyyy,dd.mm.yyyy,dd.mm.yyyy,dd/mm/yyyy,dd.mm.yyyy,dd.mm.yyyy,dd.mm.yyyy,d/m/yyyy,dd-mm-yyyy,dd/mm/yyyy,dd/mm/yyyy,dd/mm/yyyy,yyyy-mm-dd";
	var ListPos = 0;
	if ( ArrayLen(Arguments) )
		Locale = Arguments[1]; 
	ListPos = ListFindNoCase(LocaleList, Locale);
	if ( ListPos )
		return ListGetAt(MaskList, ListPos);
	else 
		return "";	
}