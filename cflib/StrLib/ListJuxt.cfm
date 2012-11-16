function ListJuxt(list1,list2)
{
  var i=1;
  var newList="";
  var delim1=",";
  var delim2 = ",";
  var delim3 = ",";
  switch(ArrayLen(arguments)) {
    case 3:
      {
        delim1 = Arguments[3];
        break;
      }
    case 4:
      {
        delim1 = Arguments[3];
        delim2 = Arguments[4];
        break;
      }
    case 5:
      {
        delim1 = Arguments[3];
        delim2 = Arguments[4];          
        delim3 = Arguments[5];
        break;
      }        
  }

  for(i=1;i lte Max(ListLen(list1, delim1),ListLen(list2, delim2));i=i+1){
    if(i lte ListLen(list1, delim1)){
      newList=ListAppend(newList,ListGetAt(list1,i,delim1),delim3);
    }
    else{
      newList=ListAppend(newList,"",delim3);
    }
    if(i lte ListLen(list2, delim2)){
      newList=ListAppend(newList,ListGetAt(list2,i,delim2),delim3);
    }
    else{
      newList=ListAppend(newList,"",delim3);
    }
  }
  return newList;
}