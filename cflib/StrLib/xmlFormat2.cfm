function xmlFormat2(inString) {
   
   var goodChars = "!@##$%^*()0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~[]{};:,./?\| -_=+#chr(13)##chr(10)##chr(9)#";
   var i = 1;
   var c = "";     
   var s = "";
   
   for (i=1; i LTE len(inString); i=i+1) {
      
      c = mid(inString, i, 1);
      
      if (find(c, goodChars)) {
         s = s & c;
      } else {
         s = s & "&##" & asc(c) & ";";
      }
   }
   
   return s;
}