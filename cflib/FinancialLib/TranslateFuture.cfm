function TranslateFuture(Symbol) {
	var	TheYear				=	'';
	var	TheMonth			=	'';
	var SymbolStruct		=	StructNew();
	
	if(Symbol IS NOT '') {
		Symbol				=	replace(Symbol,'0','');
		TheYear				=	'200' &  val(Reverse(Symbol));
		Symbol				=	Replace(symbol,val(reverse(symbol)),'');
		TheMonth			=	right(symbol,1);
		switch(TheMonth)
		{
			case 'F':	{	TheMonth	=	'January';		break;		}
			case 'G':	{	TheMonth	=	'February';		break;		}
			case 'H':	{	TheMonth	=	'March';		break;		}
			case 'J':	{	TheMonth	=	'April';		break;		}
			case 'K':	{	TheMonth	=	'May';			break;		}
			case 'M':	{	TheMonth	=	'June';			break;		}
			case 'N':	{	TheMonth	=	'July';			break;		}
			case 'Q':	{	TheMonth	=	'August';		break;		}
			case 'U':	{	TheMonth	=	'September';	break;		}
			case 'V':	{	TheMonth	=	'October';		break;		}
			case 'X':	{	TheMonth	=	'November';		break;		}
			case 'Z':	{	TheMonth	=	'December';		break;		}				
		}
		
		
		Symbol				=	left(symbol,len(symbol)-1);
		SymbolStruct.Year	=	TheYear;
		SymbolStruct.Root	=	Symbol;
		SymbolStruct.Month	=	TheMonth;
	}
	else {
		SymbolStruct		=	structnew();	
		SymbolStruct.Year	=	'';
		SymbolStruct.Root	=	'';
		SymbolStruct.Month	=	'';
	}
	return(symbolStruct);
}