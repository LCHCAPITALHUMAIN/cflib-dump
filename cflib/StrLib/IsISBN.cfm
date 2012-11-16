function IsISBN(isbn)  {
 	var total       = 0;
  	var test        = 0;
    var check_digit = 0;
    var i = 1;
	
    if (len(isbn) neq  10) return false;
	
	test = left(isbn,9);
	check_digit = right(isbn,1);
	
    if (NOT isnumeric(test)) return false;
	
    for ( i = 1; i lt 10; i=i+1) {
		total = total + (Mid(isbn, i, 1) * i);
    }

    test = total mod 11; 

	if (test eq 10) test = "X";
			
	if (test eq check_digit) return true;
	else return false;
}