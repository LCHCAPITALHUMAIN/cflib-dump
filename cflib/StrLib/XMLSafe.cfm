function XMLSafe(str) {
  return XMLFormat(REReplace(str, "[^[:print:]]", "", "ALL"));
}