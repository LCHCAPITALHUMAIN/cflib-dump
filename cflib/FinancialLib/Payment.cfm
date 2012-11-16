function Payment(IR,PV,FV,NP) {
  var tir = abs(ir) / 12;
  var tfv = abs(fv);
  var tpv = abs(pv);
  var scale = 0;
  var pmt=0;
  var q = (1 + tir)^ abs(np);

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[5]);
  }
  pmt = (tir * (tfv + q * tpv)) / (-1 + q);
  if (scale NEQ 0)
    pmt = int(pmt * scale + 0.5) / scale;
  return(-pmt);
}