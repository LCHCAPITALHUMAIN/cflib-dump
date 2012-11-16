function FixMacPost() {
  var thisField	= "";
	
  if (findNoCase("mac", cgi.HTTP_USER_AGENT) AND findNoCase("msie", cgi.HTTP_USER_AGENT)) {
    for (thisField in form) {
      if ((len(form[thisField]) GTE 2) AND NOT findNoCase(getTempDirectory(), form[thisField])) {
       form[thisField] = trim(form[thisField]);
      }
    }
  }
  return true;

}