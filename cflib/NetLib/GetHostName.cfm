function GetHostName(address) {
   // Variables
   var iaclass="";
   var addr="";
   
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   // Get address
   addr=iaclass.getByName(address);

   // Return the name	
   return addr.getHostName();
}