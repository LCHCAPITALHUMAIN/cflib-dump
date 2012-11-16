function Polynomial(x, a1, a0)
{ 
	var RetVal = a1 * x + a0;  
	var arg_count = ArrayLen(Arguments);
	var opt_arg = 4;
	for( ; opt_arg LTE arg_count; opt_arg = opt_arg + 1 )
	{
		RetVal = RetVal * x + Arguments[opt_arg];
	}
	return(RetVal); 
}