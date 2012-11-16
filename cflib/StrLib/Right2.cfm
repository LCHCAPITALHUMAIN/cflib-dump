function right2( string, length )
{
  if( length GT 0 )
    return right( string, length );
  else if( length LT 0 )
    return right( string, len( string ) + length );
  else return "";
}