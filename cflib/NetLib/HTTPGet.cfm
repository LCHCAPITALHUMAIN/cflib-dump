function HTTPGet(u) {
   // Variables
   var urlclass="";
   var page="";
   var stream="";
   var c="";
   var output="";
   
   // Init class
   urlclass=CreateObject("java", "java.net.URL");

   // Get page
   page=urlclass.init(u);

   // Get stream
   stream=page.getContent();
	
   // Display it
   for (c=stream.read(); c GT 0; c=stream.read())
   {
      output=output&chr(c);
   }

   // don't forget this part
   stream.close();
   
   return output;
}