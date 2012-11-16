function ReGroupBy(mydata,col){
  var i = "";
  var sttemp = structnew();
  var thisValue = "";
  for (i=1; i LTE arraylen(mydata); i=i+1){
    thisValue = mydata[i][col];
    if (not structkeyexists(sttemp, thisValue)){
      sttemp[thisValue] = arraynew(1);
    }
    arrayappend(sttemp[thisValue] , mydata[i]);
  }
  return sttemp;
}