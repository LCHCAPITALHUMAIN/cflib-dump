function MakePassword()
{      
  var valid_password = 0;
  var loopindex = 0;
  var this_char = "";
  var seed = "";
  var new_password = "";
  var new_password_seed = "";
  while (valid_password eq 0){
    new_password = "";
    new_password_seed = CreateUUID();
    for(loopindex=20; loopindex LT 35; loopindex = loopindex + 2){
      this_char = inputbasen(mid(new_password_seed, loopindex,2),16);
      seed = int(inputbasen(mid(new_password_seed,loopindex/2-9,1),16) mod 3)+1;
      switch(seed){
        case "1": {
          new_password = new_password & chr(int((this_char mod 9) + 48));
          break;
        }
	case "2": {
          new_password = new_password & chr(int((this_char mod 26) + 65));
          break;
        }
        case "3": {
          new_password = new_password & chr(int((this_char mod 26) + 97));
          break;
        }
      } //end switch
    }
    valid_password = iif(refind("(O|o|0|i|l|1|I|5|S)",new_password) gt 0,0,1);	
  }
  return new_password;
}