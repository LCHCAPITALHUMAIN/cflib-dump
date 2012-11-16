function FilterMask(value, mask) {

 var filter = ",";
 var t_value = "";
 var pos = 1;
 var t_value_len = 0;
 var character = "";
 var literal = 0;
 var char_at_pos = "";
 var argc = ArrayLen(arguments);
 
 if (argc EQ 2) ArrayAppend(arguments,filter);
 filter = arguments[3];

  t_value = value;
  value = "";

  if (LCase(filter) IS "alphanumeric")
    t_value = REReplace(t_value, "[^[:alnum:]]", "", "ALL");
  else if (LCase(filter) IS "numeric")
    t_value = REReplace(t_value, "[^[:digit:]]", "", "ALL");
  else if (LCase(filter) IS "alpha")
    t_value = REReplace(t_value, "[^[:alpha:]]", "", "ALL");

  t_value_len = Len(t_value);

  
  for (i=1; i LTE Len(mask); i = i + 1) {
    character = Mid(mask, i, 1);
    if (literal)
    {
      value = value & character;
      literal = "0";
    } else
    {
      if (t_value_len GTE pos)
        char_at_pos = Mid(t_value, pos, 1);
      else
        char_at_pos = "";
      
      pos = pos + 1;
      if (character IS "9") {
        if (IsNumeric(char_at_pos)) value = value & Val(char_at_pos);
      } else
      if (character IS "0") {
        value = value & Val(char_at_pos);
      } else
      if (character IS "_") {
        value = value & char_at_pos;
      } else
      if (character IS "A") {
        value = value & UCase(char_at_pos);
      } else
      if (character IS "a") {
        value = value & LCase(char_at_pos);
      } else
      if (character IS "B") {
        if (NOT IsNumeric(char_at_pos)) value = value & UCase(char_at_pos);
      } else
      if (character IS "b") {
        if (NOT IsNumeric(char_at_pos)) value = value & LCase(char_at_pos);
      } else
      if (character IS "\") {
        literal = 1;
        pos = pos - 1;
      }
      else {
        value = value & character;
        pos = pos - 1;
      }
    }
  }
  
  return value;
}