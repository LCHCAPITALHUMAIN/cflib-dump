function CssCompactFormat(sInput) {
  sInput = reReplace( sInput, "[[:space:]]{2,}", " ", "all" );
  sInput = reReplace( sInput, "/\*[^\*]+\*/", " ", "all" );
  sInput = reReplace( sInput, "[ ]*([:{};,])[ ]*", "\1", "all" );
  return sInput;
}