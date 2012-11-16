function left2( string, length )
{
  if( length GT 0 )
    return left( string, length );
  else if( length LT 0 )
    return left( string, len( string ) + length );
  else return "";
}