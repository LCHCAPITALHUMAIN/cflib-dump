function ConvertSpecialChars(textin) {
       var bad = "#chr(145)#,#chr(146)#,#chr(147)#,#chr(148)#,#chr(151)#,#CHR(8217)#,#CHR(8216)#,#chr(188)#,#chr(189)#,#chr(190)#,#chr(174)#,#chr(173)#,#chr(169)#,#chr(160)#,#chr(153)#,#chr(150)#,#chr(149)#,#chr(133)#,#CHR(8220)#,#CHR(8221)#";
       var good = "',',"","",-,',',1/4,1/2,3/4,(R),-,(C), ,TM,--,*,...,"",""";
       return ReplaceList(textin, bad, good);
}