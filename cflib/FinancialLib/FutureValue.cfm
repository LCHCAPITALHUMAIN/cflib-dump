function FutureValue(IR,PMT,PV,NP) {
  var tpv = abs(pv);
  var tnp = abs(np);
  var fv = pv;
  var tpmt = -abs(pmt);
  var tir = abs(ir) / 12;
  var scale=0;

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[4]);
  }
  if (ir eq 0) {
    fv = tpv + abs(tpmt * tnp);
  } else {
    q = (1 + tir)^tnp;
    fv = (-pmt + q * pmt + tir * q * tpv) / tir;
  }
  if (scale NEQ 0) {
    fv = int(fv * scale + 0.5) / scale;
  }
  return(-fv);
}