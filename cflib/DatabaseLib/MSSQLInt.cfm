function MSSQLInt(number) {
	if (val(number) LT -2147483648 OR val(number) GT 2147483247) return 0;
	else return number;
}