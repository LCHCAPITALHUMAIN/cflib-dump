function httpOrS() {   
   if(cgi.server_port_secure IS TRUE) return "https";
   else return "http";
}