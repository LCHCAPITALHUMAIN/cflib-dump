function ageSinceDOB(dob) {
  
  var ageYR = DateDiff('yyyy', dob, NOW());
  var ageMO = DateDiff('m', dob, NOW());
  var ageWK = DateDiff('ww', dob, NOW());
  var ageDY = DateDiff('d', dob, NOW());
  var age = "";
  
  if ( isDate(dob) ){    
    if (now() LT dob){
      age = "NA";
    }else{  
      if (ageYR LT 2) {
        age = ageMO & "m";
          if (ageMO LT 1) {
		    age = ageWK & "w";
		  }
		  if (ageWK LT 1) {
		    age = ageDY & "d";
		  }
	  }else{
	    age = ageYR & "y";
	  }  
    }  
  }else{    
    age = "NA";
  }  
  return age;
}