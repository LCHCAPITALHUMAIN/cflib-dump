function StringSplice(string, p)
{
// used later for length to cut out.
var c = 0;
var p1="";
var p2="";
// likely going to use length.
var l = len(string);


// TODO: Add better check for properly formatted Pattern P

// if no : then a single number.
if ( not FindNoCase(":",p) ) 
{
c = val(p);
	if ( c GTE 0 ) 
	{
		return Mid(string,c,1);
	}
	else  
	{
		return Mid(string,l+c+1,1);
	}

}


// If the user omits this pads the left or write of the string so that GetToken functions. 
//Faster parse probably better. 
if ( Left(p, 1) IS ":") p = " " & p;
if ( Right(p, 1) IS ":") p = p & " ";

// P1 is token on left of : if any 
// p2 is token on right of : if any.
p1 = GetToken(p,1,":");
p2 = GetToken(p,2,":");


// if not length of p1 it is 1. CF is one based.
if ( val(p1) IS 0 ) p1 = 1;
// if not length then p2 is the length of the string + 1...since CF is 1 based.
if ( val(p2) IS 0 ) p2 = l + 1;

// if less then 0 then p2 actually should be set to l - abs(p2)
if ( p2 LT 0 ) p2 = l + p2 + 1;

if ( p1 LT 0 ) return ""; // Error condition.
if ( p1 GT p2 ) return ""; // Error condition.

// since mid takes a start count not start and end like a proper language...convert.
c = p2 - p1;

return Mid(string,p1,c);
}