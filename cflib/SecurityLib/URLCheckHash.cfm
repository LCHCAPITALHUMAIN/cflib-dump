function URLCheckHash()
{
  var tmp=CGI.Query_String;
  var listL=0;
  var loop=0;
  var URLVar="";
  var HashData="";

  if (IsDefined("URL.Hash"))
  {
    if (URL.Hash NEQ "")
    {
      listL=ListLen(tmp,"&");
      URLVar=ListGetAt(tmp,ListL,"&");
      if (Left(UCase(URLVar),5) EQ "HASH=")
      {
        tmp=ListDeleteAt(tmp,ListL,"&");
      }
      HashData=cgi.Server_Name & cgi.Remote_Addr & cgi.Script_Name & tmp;
      if (URL.Hash EQ Hash(HashData)) return 1;
      else return 0;
    } else return 0;
  } else return 0;
}