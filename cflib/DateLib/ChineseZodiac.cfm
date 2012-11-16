function ChineseZodiac(yyyy) {
  var Animals = ListToArray("Monkey,Chicken,Dog,Pig,Mouse,Ox,Tiger,Rabbit,Dragon,Snake,Horse,Sheep");
  return Animals[(yyyy MOD 12) + 1];	
}