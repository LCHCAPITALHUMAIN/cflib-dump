function listRemoveDuplicates(lst) {
    var i       = 0;
    var delim   = ",";
    var asArray = "";
    var set     = StructNew();

    if (ArrayLen(arguments) gt 1) delim = arguments[2];

    asArray = ListToArray(lst, delim);
    for (i = 1; i LTE ArrayLen(asArray); i = i + 1) set[asArray[i]] = "";

    return structKeyList(set, delim);
}