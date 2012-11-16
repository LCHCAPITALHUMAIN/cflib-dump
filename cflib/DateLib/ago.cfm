function ago(dateThen){
  var result = "";
  var i = "";
  var rightNow = Now();
  Do
  {
       i = dateDiff('yyyy',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# years ago";
     break;}
  else if (i EQ 1){
     result = "#i# year ago";
     break;}

       i = dateDiff('m',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# months ago";
     break;}
  else if (i EQ 1){
     result = "#i# month ago";
     break;}

       i = dateDiff('d',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# days ago";
     break;}
  else if (i EQ 1){
     result = "#i# day ago";
     break;}

       i = dateDiff('h',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# hours ago";
     break;}
  else if (i EQ 1){
     result = "#i# hour ago";
     break;}

       i = dateDiff('n',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# minutes ago";
     break;}
  else if (i EQ 1){
     result = "#i# minute ago";
     break;}

       i = dateDiff('s',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# seconds ago";
     break;}
  else if (i EQ 1){
     result = "#i# second ago";
     break;}
  else{
    result = "less than 1 second ago";
     break;
     }
  }
  While (0 eq 0);
  return result;
}