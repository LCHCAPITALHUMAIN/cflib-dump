<cffunction name="toXML" output="false" returntype="String">
	<cfargument name="input" type="Any" required="true" />
	<cfargument name="element" type="string" required="true" />
	<cfscript>
		var i = 0;
		var s = "";
		var s1 = "";
		s1 = arguments.element;
		if (right(s1, 1) eq "s") {
			s1 = left(s1, len(s1)-1);
		}
		
		s = s & "<#lcase(arguments.element)#>";
		if (isArray(arguments.input)) {
			for (i = 1; i lte arrayLen(arguments.input); i = i + 1) {
				if (isSimpleValue(arguments.input[i])) {
					s = s & "<#lcase(s1)#>" & arguments.input[i] & "</#lcase(s1)#>";
				} else {
					s = s & toXML(arguments.input[i], s1);
				}
			}
		} else if (isStruct(arguments.input)) {
			for (i in arguments.input) {
				if (isSimpleValue(arguments.input[i])) {
					s = s & "<#lcase(i)#>" & arguments.input[i] & "</#lcase(i)#>";
				} else {
					s = s & toXML(arguments.input[i], i);
				}
			}
		} else {
			s = s & XMLformat(arguments.input);
		}
		s = s & "</#lcase(arguments.element)#>";
	</cfscript>
	<cfreturn s />
</cffunction>