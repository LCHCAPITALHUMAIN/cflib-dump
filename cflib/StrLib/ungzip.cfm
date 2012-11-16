<cffunction name="ungzip"
	returntype="any"
	displayname="ungzip"
	hint="decompresses a binary|(base64|hex|uu) using the gzip algorithm; returns string"
	output="no">
	<!---
		Acknowledgements:
		Christian Cantrell, byte array for CF
		 - http://weblogs.macromedia.com/cantrell/archives/2004/01/byte_arrays_and_1.cfm
	--->
	<cfscript>
		var bufferSize=8192;
		var byteArray = createObject("java","java.lang.reflect.Array").newInstance(createObject("java","java.lang.Byte").TYPE,bufferSize);
		var decompressOutputStream=createObject("java","java.io.ByteArrayOutputStream").init();
		var input=0;
		var decompressInputStream=0;
		var l=0;
		if(not isBinary(arguments[1]) and arrayLen(arguments) is 1) return;
		if(arrayLen(arguments) gt 1){
			input=binaryDecode(arguments[1],arguments[2]);
		}else{
			input=arguments[1];
		}
		decompressInputStream=createObject("java","java.util.zip.GZIPInputStream").init(createObject("java","java.io.ByteArrayInputStream").init(input));
		l=decompressInputStream.read(byteArray,0,bufferSize);

		while (l gt -1){
			decompressOutputStream.write(byteArray,0,l);
			l=decompressInputStream.read(byteArray,0,bufferSize);
		}
		decompressInputStream.close();
		decompressOutputStream.close();

		return decompressOutputStream.toString();
	</cfscript>
</cffunction>