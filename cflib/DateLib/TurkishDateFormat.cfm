function TurkishDateFormat(GivenDate,DateDisplayFormat){
  var ChangedDate=DateFormat(GivenDate,"mm/dd/yyyy");
  var Ay="";
  var Yil="";
  var Gun = "";
  var DateToDisplay = "";

  if(DateDisplayFormat IS "2" OR DateDisplayFormat IS "4"){
    Gun = ReplaceList(DateFormat(ChangedDate,"ddd"),"Mon,Tue,Wed,Thu,Fri,Sat,Sun","Pazartesi,Sal?,?ar?amba,Per?embe,Cuma,Cumartesi,Pazar");
  }	
  Ay = ReplaceList(DateFormat(ChangedDate,"mm"),"01,02,03,04,05,06,07,08,09,10,11,12","Ocak,?ubat,Mart,Nisan,May?s,Haziran,Temmuz,A?ustos,Eyl?l,Ekim,Kas?m,Aral?k");
  Yil = DateFormat(GivenDate,"yyyy");

  switch(DateDisplayFormat){
    case 1: {
      DateToDisplay = DateFormat(GivenDate,"dd")&"/"&Ay&"/"&Yil;
      break;
    }
    case 2: {
      DateToDisplay = DateFormat(GivenDate,"dd")&"/"&Ay&"/"&Yil&" "&Gun;
      break;
    }
    case 3: {
      DateToDisplay = DateFormat(GivenDate,"dd")&" "&Ay&" "&Yil;
      break;
    }
    case 4: {
      DateToDisplay = DateFormat(GivenDate,"dd")&" "&Ay&" "&Yil&" "&Gun;
      break;
    }
    case 5: {
      DateToDisplay = DateFormat(GivenDate,"dd");
      break;
    }
    case 6: {
      DateToDisplay = Ay;
      break;
    }
    case 7: {
      DateToDisplay = Gun;
      break;
    }
    case 8: {
      DateToDisplay = Yil;
      break;
    }    
  }
  return DateToDisplay;
}