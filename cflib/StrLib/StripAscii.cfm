function StripAscii(str)
{
  return REReplace(str, "&(##[0-9]{1,3}|[[:alpha:]]*[[:alnum:]]+);", "", "ALL");
}