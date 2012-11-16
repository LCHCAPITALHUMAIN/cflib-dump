function CelsiusToRankine(celsius)
{
  if (celsius lt -273.15)
    return -1;
  else
    return (celsius*1.8)+491.67;
}