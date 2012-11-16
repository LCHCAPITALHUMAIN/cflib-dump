function IsMulticastAddress(address) {
   // Variables
   var iaclass="";
   var addr="";
   
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   // Get address
   addr=iaclass.getByName(address);

   // Is Multicast (Class D)?
   return addr.isMulticastAddress();
}