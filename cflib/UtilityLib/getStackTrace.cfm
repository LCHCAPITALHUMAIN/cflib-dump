function getStackTrace() {
  var j = "";
  var i = "";
  var StackTrace = "";
  
  try
  {
    j = CreateObject("java","java.lang.Throwable");
    j = j.getStackTrace();

    StackTrace = QueryNew("ClassName,MethodName,NativeMethod,LineNumber,hashCode");
    QueryAddRow(StackTrace,ArrayLen(j));
  
    for (i=1; i le ArrayLen(j); i = i+1)
    {
      QuerySetCell(StackTrace,'ClassName',j[i].getClassName(),i);
      QuerySetCell(StackTrace,'MethodName',j[i].getMethodName(),i);
      QuerySetCell(StackTrace,'NativeMethod',j[i].isNativeMethod(),i);
      QuerySetCell(StackTrace,'LineNumber',j[i].getLineNumber(),i);
      QuerySetCell(StackTrace,'hashCode',j[i].hashCode(),i);
    }
  }
  catch ( any e )
  {
    return e;
  }
  
  return StackTrace;
}