function IsClientTimeout(timespan)
{
  if (DateCompare(CreateODBCDateTime(Now()), DateAdd("s", (Round(timespan* 86400)), Client.LastVisit)) GTE 0){ 
    Return True;
  }
  else{
    Return False;
  }
}