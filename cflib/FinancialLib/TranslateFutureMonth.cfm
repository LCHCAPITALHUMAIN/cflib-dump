function TranslateFutureMonth(monthcode) {
	var TheMonth =	'';
	switch(Monthcode)
	{
		// Translate the letter code into the month code
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
		// Translate the month description into the letter code
		case 'January':		{	TheMonth	=	'F';	break;		}
		case 'February':	{	TheMonth	=	'G';	break;		}
		case 'March':		{	TheMonth	=	'H';	break;		}
		case 'April':		{	TheMonth	=	'J';	break;		}
		case 'June':		{	TheMonth	=	'M';	break;		}
		case 'July':		{	TheMonth	=	'N';	break;		}
		case 'August':		{	TheMonth	=	'Q';	break;		}
		case 'September':	{	TheMonth	=	'U';	break;		}
		case 'October':		{	TheMonth	=	'V';	break;		}
		case 'November':	{	TheMonth	=	'X';	break;		}
		case 'December':	{	TheMonth	=	'Z';	break;		}
		// Translate 3 letter month code into letter code
		case 'Jan':			{	TheMonth	=	'F';	break;		}
		case 'Feb':			{	TheMonth	=	'G';	break;		}
		case 'Mar':			{	TheMonth	=	'H';	break;		}
		case 'Apr':			{	TheMonth	=	'J';	break;		}
		case 'May':			{	TheMonth	=	'K';	break;		}
		case 'Jun':			{	TheMonth	=	'M';	break;		}
		case 'Jul':			{	TheMonth	=	'N';	break;		}
		case 'Aug':			{	TheMonth	=	'Q';	break;		}
		case 'Sep':			{	TheMonth	=	'U';	break;		}
		case 'Oct':			{	TheMonth	=	'V';	break;		}
		case 'Nov':			{	TheMonth	=	'X';	break;		}
		case 'Dec':			{	TheMonth	=	'Z';	break;		}
	}
	
	return(TheMonth);		
}