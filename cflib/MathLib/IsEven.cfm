function IsEven(num) {
  // We only operate on numbers, otherwise we
  // we just return false.
  if (IsNumeric(num)) {
    //if it's evenly divisible by 2, it's
    //even. otherwise, it's odd. ;)
    return (not num mod 2);
  }
  else {
    return No;
  }
}