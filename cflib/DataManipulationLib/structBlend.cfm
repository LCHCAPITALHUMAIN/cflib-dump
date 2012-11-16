function structBlend(Struct1,Struct2) {
	var i = 1;
	var OverwriteFlag = true;
	var StructKeyAr = listToArray(structKeyList(Struct2));
	var Success = true;
  	if ( arrayLen(arguments) gt 2 AND isBoolean(Arguments[3]) ) // Optional 3rd argument "OverwriteFlag"
  		OverwriteFlag = Arguments[3];
		try {
			for ( i=1; i lte structCount(Struct2); i=i+1 ) {
				if ( not isDefined('Struct1.#StructKeyAr[i]#') )  // If structkey doesn't exist in Struct1
					Struct1[StructKeyAr[i]] = Struct2[StructKeyAr[i]]; // Copy all as is.
				else if ( isStruct(struct2[StructKeyAr[i]]) )			// else if key is another struct
					Success = structBlend(Struct1[StructKeyAr[i]],Struct2[StructKeyAr[i]],OverwriteFlag);  // Recall function
				else if ( OverwriteFlag )	// if Overwrite
					Struct1[StructKeyAr[i]] = Struct2[StructKeyAr[i]];  // set Struct1 Key with Struct2 value.
			}
		}
		catch(any excpt) { Success = false; }
	return Success;
}