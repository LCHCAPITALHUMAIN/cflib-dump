function padDirection(string,char,number) {
   // set up variables
   var strLen = len(string);
   var padLen = number - strLen;
   var returnValue = string;
   var charD = "R";

   if(arrayLen(arguments) gte 4) charD = arguments[4]; 
   if (strLen gte number) return string;
   
   if (charD eq "R") return string & RepeatString(char, padLen);
   else return RepeatString(char, padLen) & string;
}