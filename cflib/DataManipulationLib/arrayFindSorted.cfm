function arrayFindSorted(arrayX, value) 
{
	var m = 0;	
	var found = 0;
	var done = 0;
	var hi = arrayLen(arrayX)+1;
	var lo = 1;
	var i = 1;
	var maxtest = 500;
	do {
		m = (hi + lo) \ 2;
		if (arrayX[m] EQ value)
		{
			found = 1;
			done = 1;
		}
		else
		{
			if ((m EQ lo) or (m EQ hi))
				done = 1; /* not found */
			else
			{	
				if (value LT arrayX[m])
				{
				/* higher */
					hi = m;
				}
				else
				{
				/* lower */
					lo = m;
				}
			}
		}
		if (i EQ maxtest)
			{
			done = 1;
			writeoutput("Error! overflow in search");
			}
		else
			i = i + 1;
	} while (done EQ 0);
	if (found)
		return m;
	else
		return 0;
}