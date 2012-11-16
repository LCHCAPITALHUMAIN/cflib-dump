function isDefinedValueMX(varname)
{
  var varvalue = "";
    try{
    if (IsDefined(listfirst(Arguments[1],"[")))
     { 
     varvalue = evaluate(Arguments[1]);

     if (IsSimpleValue(varvalue))
        { 
            if (ArrayLen(Arguments) EQ 2 )
                { if ( varvalue EQ Arguments[2]){return 1;}
                else return 0; 
                }
            else if ( find(varvalue,"" )) {return 0;}  
            else return 1;  // something is there, just not testing for it.
        } 
     else if (IsStruct(varvalue))
        { 
            if (StructIsEmpty(varvalue)) { return 0;} 
            else {return 1;}
        }
     else if (IsArray(varvalue))
        { 
            if (ArrayIsEmpty(varvalue)) {return 0;} 
            else {return 1;}
        }
     else if (IsQuery(varvalue))
        { 
            if (YesNoFormat(varvalue.recordcount)) {return 1;} 
            else {return 0;}
        }
    return 0; // not defined
      }
     } //try
     catch(Any excpt)
      { return 0;} // return excpt.Message;
return 0; 
}