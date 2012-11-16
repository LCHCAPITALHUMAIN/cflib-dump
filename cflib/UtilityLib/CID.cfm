function CID() {
  // Create a globally unique identifier
  return lCase(CreateUUID() & "@" & listFirst(cgi.server_name,"."));
}