function magicQuote(txt) {
    // Left quotes
    txt = REReplace(txt, "(^|[ " & Chr(9) & Chr(10) & Chr(13) & "'])""", "\1&##8220;", "ALL");
    txt = REReplace(txt, "(^|[ " & Chr(9) & Chr(10) & Chr(13) & "]|&##8220;)'",  "\1&##8216;", "ALL");

    // Right quotes
    txt = Replace(txt, """",        "&##8221;",  "ALL");
    txt = Replace(txt, "'&##8220;", "'&##8221;", "ALL");
    txt = Replace(txt, "'",         "&##8217;",  "ALL");

    return txt;
}