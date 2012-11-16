function Convert2Number(StrVal){
  var regStr = "[^/.0123456789-]";
  return Val(REReplace(StrVal,regStr,"","all"));
}