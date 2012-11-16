<cffunction name="calcIRR" output="false">
	<cfargument name="arrCashFlow" type="Array" required="yes" hint="array of cashflow">
	<cfscript>
		var guess = 0.1;
		var inc   = 0.00001;
		do {
			guess += inc;
			npv = 0; //net present value
			for (var i=1; i<=arrayLen(arguments.arrCashFlow); i++)	{
				npv += arguments.arrCashFlow[i] / ((1 + guess) ^ i);	
			}
			
		} while ( npv > 0 );
		
		guess =  guess * 100;
	</cfscript>
	<cfreturn guess>
</cffunction>