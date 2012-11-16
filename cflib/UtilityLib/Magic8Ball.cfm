function Magic8Ball(question){
  var validQuestion=False;
  var wordList="am,are,can,could,couldn't,will,would,wouldn't,won't,was,wasn't,must,musn't,may,if,is,isn't,should,shouldn't,do,did,don't,shall,shant";
  var i=0;
  var Answer=ArrayNew(1);
  for (i=1; i lte ListLen(wordList); i=i+1) {
    if (ListFirst(question, " ") EQ ListGetAt(wordList, i)){
	    validQuestion=True;
      break;
      }
  }
  // Initialize an array with all of the responses 
  Answer[1] = "Most likely";
  Answer[2] = "Very doubtful";
  Answer[3] = "It is certain";
  Answer[4] = "My sources say NO";
  Answer[5] = "As I see it, yes";
  Answer[6] = "Concentrate and ask again";
  Answer[7] = "My reply is NO";
  Answer[8] = "Signs point to yes";
  Answer[9] = "Cannot predict now";
  Answer[10] = "Outlook Good";
  Answer[11] = "Reply hazy, try again";
  Answer[12] = "It is decidedly so";
  Answer[13] = "Don't count on it";
  Answer[14] = "My sources say Yes";
  Answer[15] = "Yes, Definetly";
  Answer[16] = "Ask again later";
  Answer[17] = "Without a doubt";
  Answer[18] = "Outlook not so good";
  Answer[19] = "You may rely on it";
  Answer[20] = "Better not tell you now";
  Answer[21] = "YES";
  Answer[22] = "NO";
  
  if (ValidQuestion EQ True)
    return Answer[RandRange(1,22)];
  else
    return "I'm not sure I understand.  Please rephrase the question and ask again.";
}