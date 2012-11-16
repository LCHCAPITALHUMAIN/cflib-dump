function rot13(string)
{
  var i=0;
  var j=0;
  var k=0;
  var out="";
  for (i=1; i LTE Len(String); i=i+1){
    j=Asc(Mid(string, i, 1));
    if(j GTE 65 AND j LTE 90){
      j=((J-52) MOD 26)+65;
    }
    else if(j GTE 97 AND j LTE 122){
      j=((j-84) MOD 26)+97;
    }
    out=out&Chr(j);
  }
  return out;
}