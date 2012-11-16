function Periods(IR,PV,FV,PMT) {
  var tir = ir / 12;
  var scale = 0;
  var np=0;
  var tpv = -abs(pv);
  var tfv = -abs(fv);
  var tpmt = abs(pmt);

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[5]);
  }
  np = log((-tfv * tir + tpmt) / (tpmt + tir * tpv)) / log(1 + tir);
  if (scale NEQ 0)
    np = int(np * scale + 0.5) / scale;
  return(np);
}