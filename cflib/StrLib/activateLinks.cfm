function activateLinks( string )
{
	var stringLen = len( string );
	var currentPosition = 1;
	var urlArray = [];

	while( currentPosition < stringLen )
	{
		rezArray = REFindNoCase( "(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'"".,<>?«»‘’]))", arguments.string, currentPosition, true );
		
		if( rezArray.len[1] != 0 ){
			arrayAppend( urlArray, mid( string, rezArray.pos[1]-2, rezArray.len[1]+2 ) );
			currentPosition = rezArray.pos[1] + rezArray.len[1];
		} else {
			currentPosition = stringLen;
		}
	}

	for( i = 1; i <= arrayLen( urlArray ); i++ )
	{
		if( left( urlArray[i], 2 ) != '="' )
		{
			link = right( urlArray[i], len( urlArray[i] )-2 );
			string = replace( string, link, '<a href="'& link &'">'& link &'</a>', "all" );
		} else {
			i++;
		}
	}

	return string;
}