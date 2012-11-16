function ClientLocale() {
	var FirstLocale = SpanExcluding(CGI.HTTP_ACCEPT_LANGUAGE, ",;");
	var LanguageCode = ListFirst(FirstLocale, "-");
	var CountryCode = "";
	if ( ListLen(FirstLocale, "-") EQ 2 )
		CountryCode = ListGetAt(FirstLocale, 2, "-");
	switch(LanguageCode){
  			case "nl":
			switch(CountryCode){
  					case "be":
     					return "Dutch (Belgian)";
				default:
     					return "Dutch (Standard)";
			}		
		case "en":
			switch(CountryCode){
  					case "au":
     					return "English (Australian)";
				case "ca":
     					return "English (Canadian)";
				case "nz":
     					return "English (New Zealand)";
				case "gb":
     					return "English (UK)";
				case "us":
     					return "English (US)";
				default:
					return "English (UK)";
			}		
		case "fr":
			switch(CountryCode){
				case "be":
					return "French (Belgian)";
				case "ca":
					return "French (Canadian)";
				case "ch":
					return "French (Swiss)";
				default:
					return "French (Standard)";
			}
		case "de":
			switch(CountryCode){
				case "at":
					return "German (Austrian)";
				case "ch":
					return "German (Swiss)";
				default:
					return "German (Standard)";
			}		
		case "it":
			switch(CountryCode){
				case "ch":
					return "Italian (Swiss)";
				default:
					return "Italian (Standard)";
			}	
		case "nb":
			return "Norwegian (Bokmal)";	
		case "nn":
			return "Norwegian (Nynorsk)";
		case "pt":
			switch(CountryCode){
				case "br":
					return "Portuguese (Brazilian)";
				default:
					return "Portuguese (Standard)";
			}	
		case "es":
			switch(CountryCode){
				case "mx":
					return "Spanish (Mexican)";
				default:
					return "Spanish (Modern)";
			}		
	    default:
    			return GetLocale();
	}		
}