function StripUrl(UrltoStrip)
{
  Var oldurl = UrltoStrip;
  
  if(oldurl CONTAINS 'http://www.'){
  	oldurl = ReplaceNoCase(oldurl, 'http://www.', '');
  }
  if(oldurl CONTAINS 'http://'){
  	oldurl = ReplaceNoCase(oldurl, 'http://', '');
  }
  if(oldurl CONTAINS 'www.'){
  	oldurl = ReplaceNoCase(oldurl, 'www.', '');
  }
  
  oldurl = ListFirst(oldurl, '/');
  Return OldUrl;
}