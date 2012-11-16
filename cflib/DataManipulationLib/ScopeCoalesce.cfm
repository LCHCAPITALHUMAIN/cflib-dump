function ScopeCoalesce(strVariable, lstScopes) {
  var vRet = "";
  var nIndex = 1;
  var nLstLen = ListLen(lstScopes);

  // assign the default return if passed in
  If (ArrayLen(Arguments) GTE 3)
    vRet = Arguments[3];

  // loop over the list
  while (nIndex LTE nLstLen) {
    if (IsDefined(ListGetAt(lstScopes, nIndex) & '.' & strVariable)) {
      vRet = Evaluate(ListGetAt(lstScopes, nIndex) & '.' & strVariable);
      break;
    }
    nIndex = nIndex + 1;
  }

  return vRet;
}