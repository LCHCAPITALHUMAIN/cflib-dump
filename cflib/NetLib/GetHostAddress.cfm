function GetHostAddress(host) {
   // Variables
   var iaclass="";
   var addr="";
   
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   // Get address
   addr=iaclass.getByName(host);

   // Return the address	
   return addr.getHostAddress();
}