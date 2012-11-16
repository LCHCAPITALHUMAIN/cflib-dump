function URLHash(URLValue)
{
  var HashData =cgi.Server_Name & cgi.Remote_Addr & cgi.Script_Name & URLValue;
  return URLValue & "&hash=" & LCase(Hash(HashData));
}