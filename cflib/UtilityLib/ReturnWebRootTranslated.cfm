function ReturnWebRootTranslated() {
  var tmpPath = Replace(CGI.SCRIPT_NAME, "/", "\", "ALL");
  return ReplaceNoCase(CGI.PATH_TRANSLATED, tmpPath, "", "ALL");
}