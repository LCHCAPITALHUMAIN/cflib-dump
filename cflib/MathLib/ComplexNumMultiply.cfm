function ComplexNumMultiply(Multiplicand,Multiplier) {
	var ComplexProduct = StructNew();
	var ComplexMultiplicand = 0;
	var ComplexMultiplier = 0;
	var R = 0;
	var I = 0;
			
	if ( IsStruct(Multiplicand) )
		ComplexMultiplicand = Multiplicand;
	else	
		ComplexMultiplicand = ComplexNum(Multiplicand,0);	
	if ( IsStruct(Multiplier) )
		ComplexMultiplier = Multiplier;
	else	
		ComplexMultiplier = ComplexNum(Multiplier,0);
				
	R = ComplexMultiplicand.R * ComplexMultiplier.R - ComplexMultiplicand.I * ComplexMultiplier.I;
	I = ComplexMultiplicand.R * ComplexMultiplier.I + ComplexMultiplicand.I * ComplexMultiplier.R;
	StructInsert(ComplexProduct, "R", R);
	StructInsert(ComplexProduct, "I", I);
	return ComplexProduct;
}