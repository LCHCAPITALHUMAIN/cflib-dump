function isDefinedValue(varname)
{
  var value = "";
    if (IsDefined(listfirst(Arguments[1],"[")))
     { 
     value = evaluate(Arguments[1]);
     if (IsSimpleValue(value))
        { 
            if (ArrayLen(Arguments) EQ 2 )
                { if ( value EQ Arguments[2]){return 1;}
                else return 0; 
                }
            else if ( find(value,"" )) {return 0;}  
            else return 1;  // something is there, just not testing for it.
        } 
     else if (IsStruct(value))
        { 
            if (StructIsEmpty(value)) { return 0;} 
            else {return 1;}
        }
     else if (IsArray(value))
        { 
            if (ArrayIsEmpty(value)) {return 0;} 
            else {return 1;}
        }
     else if (IsQuery(value))
        { 
            if (YesNoFormat(value.recordcount)) {return 1;} 
            else {return 0;}
        }
    return 0;
      }
return 0;
}