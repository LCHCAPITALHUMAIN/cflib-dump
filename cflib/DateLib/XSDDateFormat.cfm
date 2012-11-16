function XSDDateFormat(str_date){
   return DateFormat(str_date,"yyyy-mm-ddT") & TimeFormat(str_date,"HH:mm:ss");
}