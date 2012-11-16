function isPalindrome(string) {
  var newstring = rereplacenocase(string, '[^a-z1-9]','', 'ALL');
  return newstring eq reverse(newstring);
}