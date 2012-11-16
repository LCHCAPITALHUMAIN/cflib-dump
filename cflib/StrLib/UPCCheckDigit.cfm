function UPCCheckDigit(upc){
var odd = 0;
var even = 0;
var total = 0;

if (NOT IsNumeric(upc) OR Len(upc) NEQ 11)
	return(-1);

for (i=1; i LT 12; i=i+1){
		if (i MOD 2)
			odd=odd+Mid(upc, i, 1);
		else
			even=even+Mid(upc, i, 1);
	}

total=(odd*3)+even;
total=total mod 10;

if (total eq 0)
	return 0;
else
	return(10-total);
}