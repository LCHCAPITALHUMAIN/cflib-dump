function Acoth(x){
  if (x lt -1)
    return Log((x+1)/(x-1))/2;
  else
    if (x gt 1)
      return Log((x+1)/(x-1))/2;
  else
    return "undefined";
}