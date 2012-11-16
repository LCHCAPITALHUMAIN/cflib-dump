function DollarAsString(number)
{
   VAR Result="";          // Generated result
   VAR Strs=StructNew();   // Strings structure
   VAR Str="";             // Temp string
   VAR n=0;                // Temp number
   VAR Dollars=0;          // Dollar amount
   VAR Cents=0;            // Cents amount
   VAR CentsAsDigits=0;    // Cents as digits flag
   
   // Initialize strings
   if (NOT IsDefined("REQUEST.DStrs"))
   {
      REQUEST.DStrs=StructNew();
      REQUEST.DStrs.space=" ";
      REQUEST.DStrs.and="and";
      REQUEST.DStrs.dollar="Dollar";
      REQUEST.DStrs.dollars="Dollars";
      REQUEST.DStrs.cent="Cent";
      REQUEST.DStrs.cents="Cents";
   }
   
   // Check for optional parameter
   if (ArrayLen(Arguments) GTE 2 AND IsBoolean(Arguments[2]))
      CentsAsDigits=Arguments[2];
   
   // Extract dollar and cent portions
   Dollars=Int(number);
   n=Find(".", number);
   if (n)
   {
      // There is a cents value
      Str=Trim(Mid(number, n+1, Len(number)-n));
      if (Len(Str) IS 1)
         Cents=Str&"0";
      else if (Len(Str) IS 2)
         Cents=Val(Str);
      else if (Len(Str) GTE 3)
      {
         Str=Left(Str, 2)&"."&Right(Str, Len(Str)-2);
         Cents=Round(Str);
      }
   }
      
   // Build result
   if (Dollars)
      Result=Result&NumberAsString(Dollars)&REQUEST.DStrs.space&IIf(Dollars IS 1, DE(REQUEST.DStrs.dollar), DE(REQUEST.DStrs.dollars));
   if (Cents)
   {
      if (Dollars)
         Result=Result&REQUEST.DStrs.space&REQUEST.DStrs.and&REQUEST.DStrs.space;
      if (CentsAsDigits)
         Str=Cents;
      else
         Str=NumberAsString(Cents);
      Result=Result&Str&REQUEST.DStrs.space&IIf(Cents IS 1, DE(REQUEST.DStrs.cent), DE(REQUEST.DStrs.cents));
   }
   
   return Result;
}