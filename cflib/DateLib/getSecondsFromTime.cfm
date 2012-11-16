function getSecondsFromTime(timeObject){
  var theSeconds = Val(Hour(timeObject) * 3600) + Val(Minute(timeObject) * 60) + Second(timeObject);
  return theSeconds;
}