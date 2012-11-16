function isMod10(number) {
    var nDigits = Len(arguments.number);
    var parity = nDigits MOD 2;
    var digit = "";
    var sum = 0;
    var i = "";

    for (i=0; i LTE nDigits - 1; i=i+1) {
        digit = Mid(arguments.number, i+1, 1);
        if ((i MOD 2) EQ parity) {
            digit = digit * 2;
            if (digit GT 9) {
                digit = digit - 9;
            }
        }
        sum = sum + digit;
    }

    if (NOT sum MOD 10) return TRUE;
    else return FALSE;
}