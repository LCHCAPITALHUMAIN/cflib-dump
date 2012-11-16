function Bin2Hex (bin){
 var str64 = tobase64(bin);
 var result = "";
 var a = 0;
 var b = 0;
 var c = "";
 var x = "";
 var i = 1;
 if (isbinary(bin)) {
  for (i;i LTE len(str64);i=i+1){
   c = asc(mid(str64,i,1));
   if (c LT 47)x = 62;
   else if (c LT 48)x = 63;
   else if (c EQ 61)x = 0;
   else if (c LT 65)x = c+4;
   else if (c LT 97)x = c-65;
   else x = c-71;
   if (i mod 2){
    a = bitshln(x,6);
   }
   else {
    b = x;
    for (j=len(formatbasen(a+b,16));j LT 3;j=j+1){
     result = result & 0;
    }
    result = result & formatbasen(a+b,16);
    a = 0;
    b = 0;
    }
   }
   if (right(str64,2) IS "=="){
    result = left(result,len(result)-4);
   }
   else if (right(str64,1) IS "="){
    result = left(result,len(result)-2);
   }
  return result;
 }
 else {
  result = "Invalid binary data";
 }
}