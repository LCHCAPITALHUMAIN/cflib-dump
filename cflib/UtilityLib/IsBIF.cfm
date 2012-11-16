function IsBIF(name) {
    return ListFindNoCase(StructKeyList(GetFunctionList()),name) GT 0;
}