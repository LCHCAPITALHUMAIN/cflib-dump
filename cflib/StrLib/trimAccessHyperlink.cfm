function trimAccessHyperlink(str) {
    var endTag = "";
    var extract = "";
    str = trim(str);    
    endTag = findNoCase("##", str);
    if (endTag gt 0) {
        endTag = endTag - 1;
        extract = left(str, endTag);
    } else {
        extract = str;
    }
    return trim(extract);
}