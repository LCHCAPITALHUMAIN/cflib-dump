function ComplexNumAdd(First,Second) {
	var ComplexSum = StructNew();
	var ComplexFirst = 0;
	var ComplexSecond = 0;
	var R = 0;
	var I = 0;
			
	if ( IsStruct(First) )
		ComplexFirst = First;
	else	
		ComplexFirst = ComplexNum(First,0);	
	if ( IsStruct(Second) )
		ComplexSecond = Second;
	else	
		ComplexSecond = ComplexNum(Second,0);
				
	R = ComplexFirst.R + ComplexSecond.R;
	I = ComplexFirst.I + ComplexSecond.I;
	StructInsert(ComplexSum, "R", R);
	StructInsert(ComplexSum, "I", I);
	return ComplexSum;
}