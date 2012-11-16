function ListUnion(List1, List2)
{
  var TempList = "";
  var CombinedList = "";  
  Var SortType="text";
  Var SortOrder="asc";
  var Delim1 = ",";
  var Delim2 = ",";
  var Delim3 = ",";
  var i = 0;
  // Handle optional arguments
  switch(ArrayLen(arguments)) {
    case 3:
      {
        Delim1    = Arguments[3];
        break;
      }
    case 4:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        break;
      }
    case 5:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        break;
      }       
    case 6:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        SortType  = Arguments[6];
        break;
      }       
    case 7:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        SortType  = Arguments[6];
        SortOrder = Arguments[7];
        break;
      }                    
  } 
  
  // Combine list 1 and list 2 with the proper delimiter
  CombinedList = ListChangeDelims(List1, Delim3, Delim1) & Delim3 &  ListChangeDelims(List2, Delim3, Delim2);
  // Strip duplicates if indicated
  for (i=1; i LTE ListLen(CombinedList, Delim3); i=i+1) {
    if (NOT ListFindNoCase(TempList, ListGetAt(CombinedList, i, Delim3), Delim3)){
     TempList = ListAppend(TempList, ListGetAt(CombinedList, i, Delim3), Delim3);
    }
  }
  Return ListSort(TempList, SortType, SortOrder, Delim3);
}