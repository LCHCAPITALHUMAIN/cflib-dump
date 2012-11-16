function CountLines(text) {
  var CRLF = Chr(13) & Chr(10);
  return ListLen(text,CRLF);
}