function SubStr(buf, start) {
    // third argument (optional)
    var length = 0;
    var sz = 0;
		
    sz = len(buf);
    
    if (arrayLen(arguments) EQ 2) {

		if (start GT 0) {
		    length = sz;
		} else if (start LT 0) {
		    length = sz + start;
		    start = 1;
		}
	
    } else {
    
		length = Arguments[3];
		if (start GT 0) {
		    if (length LT 0)   length = 1+sz+length-start;
		} else if (start LT 0) {
		    if (length LT 0) length = length-start;
		    start = 1+sz+start;
		    
		}
    } 
    
    if (isNumeric(start) AND isNumeric(length) AND start GT 0 AND length GT 0) return mid(buf, start, length);
    else return "";
}