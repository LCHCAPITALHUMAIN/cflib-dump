function IsFunction(str) {
 if(ListFindNoCase(StructKeyList(GetFunctionList()),str)) return 1;
 if(IsDefined(str) AND Evaluate("IsCustomFunction(#str#)")) return 1;
 return 0;
}