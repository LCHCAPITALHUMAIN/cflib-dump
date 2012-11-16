function guidToString(guidByteArray) {
   var hexString='';
   
   if (IsArray(guidByteArray) AND ArrayLen(guidByteArray) GTE 16) {
     hexString=hexString & guidByteToHex(guidByteArray[4]);
     hexString=hexString & guidByteToHex(guidByteArray[3]);
     hexString=hexString & guidByteToHex(guidByteArray[2]);
     hexString=hexString & guidByteToHex(guidByteArray[1]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[6]);
     hexString=hexString & guidByteToHex(guidByteArray[5]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[8]);
     hexString=hexString & guidByteToHex(guidByteArray[7]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[9]);
     hexString=hexString & guidByteToHex(guidByteArray[10]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[11]);
     hexString=hexString & guidByteToHex(guidByteArray[12]);
     hexString=hexString & guidByteToHex(guidByteArray[13]);
     hexString=hexString & guidByteToHex(guidByteArray[14]);
     hexString=hexString & guidByteToHex(guidByteArray[15]);
     hexString=hexString & guidByteToHex(guidByteArray[16]);
   }
   
   return hexString;
}

function guidByteToHex(guidByte) {
   // Accepts a single byte and converts it to a two digit Hex number.
   
   var hexByte=Ucase(Right(FormatBaseN(guidByte, 16),2));
   if (Len(hexByte) IS 0) {
      hexByte='00';
   } else if (Len(hexByte) IS 1) {
      hexByte='0' & hexByte;
   }
   
   return hexByte;
}