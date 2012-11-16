function GetServerIP() {
   var iaclass="";
   var addr="";
      
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   //Get Local host variable
   addr=iaclass.getLocalHost();

   // Return ip address
   return addr.getHostAddress();
}