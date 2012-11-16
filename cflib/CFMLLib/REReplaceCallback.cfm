<cffunction name="REReplaceCallback" access="private" output="false" returntype="string">
  <cfargument name="string" type="string" required="true" />
  <cfargument name="pattern" type="string" required="true" />
  <cfargument name="callback" type="any" required="true" />
  <cfargument name="scope" type="string" default="one" />
  <cfscript>
  var start = 0;
  var match = "";
  var parts = "";
  var replace = "";
  var i = "";
  var l = "";
  while (true) {
    match = REFind(pattern, string, start, true);
    if (match.pos[1] EQ 0) {
      break;
    }
    parts = [];
    l = arrayLen(match.pos);
    for (i = 1; i LTE l; i++) {
      if (match.pos[i] EQ 0) {
        arrayAppend(parts, "");
      } else {
        arrayAppend(parts, mid(string, match.pos[i], match.len[i]));
      }
    }
    replace = callback(parts);
    start = start + len(replace);
    string = mid(string, 1, match.pos[1] - 1) & replace & removeChars(string, 1, match.pos[1] + match.len[1] - 1);
    if (scope EQ "one") {
      break;
    }
  }
  return string;
  </cfscript>
</cffunction>