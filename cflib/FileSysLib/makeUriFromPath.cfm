function makeUriFromPath(path) {
   var uri = path;
     
   // make all backslashes into slashes
   uri = replace(uri, "\", "/", "all");
   if (left(uri,1) is "/") {
      uri = right(uri, len(uri) - 1);
    }
     
   uri = "file:///" & uri;
    
   return uri;
}