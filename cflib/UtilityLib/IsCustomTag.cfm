function IsCustomTag() {
  return yesNoFormat( listFindNoCase( getBaseTagList(), "CF_" & listFirst( listLast( getCurrentTemplatePath(), "/\" ), "." ) ) );
}