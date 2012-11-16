function Quadratic(a, b, c)
{
  Var mRoots = StructNew();
  Var first = 0;
  Var second = 0;
  Var denom = 2 * a;
  Var arg1 = b^2 - 4 * a * c;
  if (arg1 LT 0) {
    mRoots["Root1"] = "not real";
  	mRoots["Root2"] = "not real";
  }
  else {   
  	first = -b / denom;
  	second = Sqr(arg1) / denom;
  	mRoots["Root1"] = first + second;
  	mRoots["Root2"] = first - second; 
  }
  Return mRoots;
}