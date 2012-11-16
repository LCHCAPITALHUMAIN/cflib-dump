/**
 * Returns the difference between the SOUNDEX values of two
 * strings as an integer from 0-4. 0=No match, 4=Exact match.
 *
 * Note: Requires SOUNDEX UDF from Ben Forta
 *
 * @param str1	First string to be compared
 * @param str2	Second string to be compared
 * @return returns a number from 0 to 4
 * @author Benjamin Pate B525 P300 (benjamin@pate.org)
 * @author Steven Bianco S315 B520 (steventbianco@yahoo.com)
 * @version 1, April 17, 2003
 */

function SoundexDifference(str1, str2)
{
	var temp1 = Soundex(str1);
	var temp2 = Soundex(str2);

	var i = 0;
	var result = 0;
	
	for (i = 1 ; i LTE 4 ; i = i + 1)
	{
		if (MID(temp1, i, 1) IS MID(temp2, i , 1))
		{
			result = result + 1;
		}
	}
	return result;
}