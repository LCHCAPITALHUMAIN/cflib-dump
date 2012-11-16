<cffunction name="gzip"
	returntype="any"
	displayname="gzip"
	hint="compresses a string using the gzip algorithm; returns binary or string(base64|hex|uu)"
	output="no">
	<!---
		Acknowledgements:
		Andrew Scott, original gzip compression routine
		 - http://www.andyscott.id.au/index.cfm/2006/9/12/Proof-of-Concept
	--->
	<cfscript>
		var result="";
		var text=createObject("java","java.lang.String").init(arguments[1]);
		var dataStream=createObject("java","java.io.ByteArrayOutputStream").init();
		var compressDataStream=createObject("java","java.util.zip.GZIPOutputStream").init(dataStream);
		compressDataStream.write(text.getBytes());
		compressDataStream.finish();
		compressDataStream.close();

		if(arrayLen(arguments) gt 1){
			result=binaryEncode(dataStream.toByteArray(),arguments[2]);
		}else{
			result=dataStream.toByteArray();
		}
		return result;
	</cfscript>
</cffunction>