function BRCurrencyFormat(valor) {
	valor = DecimalFormat(valor);
	valor = Replace(valor,',','.','ALL');
	valor = Reverse(Replace(Reverse(valor),'.',',','ONE'));
	if(valor LT 0) return "(R$" & Right(valor,Len(valor)-1) & ")";
	else return "R$" & valor;
}