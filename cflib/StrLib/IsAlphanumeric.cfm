function IsAlphanumeric(str) {
  if (REFindNoCase("[^a-z0-9]", str) eq 0)
    return true;
  else
    return false;
}