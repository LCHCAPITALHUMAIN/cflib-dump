function getclientvariables() {
 var lclientvarlist = getclientvariableslist();
 var stclientvar = structnew();
 var i = 1;
 for(i=1;i lte listlen(lclientvarlist);i=i+1)
 structinsert(stclientvar,"#listgetat(lclientvarlist,i)#",evaluate("client.#listgetat(lclientvarlist,i)#"));
 return stclientvar;
}