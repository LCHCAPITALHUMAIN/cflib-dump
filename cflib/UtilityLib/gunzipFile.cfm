function gunzipFile(infilePath) {
	var zipfile = "";
	var outfile = "";
	var outputPath = "";
	var infile = "";
	var gzInStream = createObject('java','java.util.zip.GZIPInputStream');
	var outStream = createObject('java','java.io.FileOutputStream');
	var inStream = createObject('java','java.io.FileInputStream');
	var buffer = repeatString(" ",1024).getBytes();
	var length = 0;
	var rv = true;
   
	if (arrayLen(Arguments) gte 2) outputPath = arguments[2];
	else outputPath = getDirectoryFromPath(infilePath);

	if (right(infilePath,3) neq '.gz') infilePath = infilePath & '.gz';

	if(right(outputPath,1) neq "/" and right(outputPath,1) neq "\") outputPath = outputPath & "/";
   
	try {
		infile = getFileFromPath(infilePath);
		outfile = outputPath & left(infile,len(infile) - 3);
		inStream.init(infilePath);
		gzInStream.init(inStream);
		outStream.init(outfile);
		do {
			length = gzInStream.read(buffer,0,1024);
            if (length neq -1) outStream.write(buffer,0,length);
		} while (length neq -1);
		outStream.close();
		gzInStream.close();
	} 
	catch (any e) {
		rv = false;
		try {
			outStream.close();
		} catch (any e) { }
			try {
				gzInStream.close();
			} catch (any e) { }
	}
	return rv;
}