function isrut(rut) {
  var dig=right(rut,1);
  var largo=0;
  var suma=0;
  var factor=2;
  var digito=0;
  var i=0;
  var valor="";
  rut=ReplaceList(rut, ".,-", "");
  rut=Left(Rut, Len(Rut)-1);
  if (isNumeric(rut)){
    largo=len(rut);
    for (i=largo;  i gte 1; i=i-1){
      if (factor gt 7) {
        factor=2;
      }
      suma = suma + factor * int(mid(rut,i,1));
      factor = factor + 1;
    }

    digito = 11 - (suma mod 11);
    switch(digito) {
      case 10: {
        valor = "K";
        break;
      }
      case 11: {
        valor = "0";
        break;
      }    
      default: {
        valor = digito;
        break;
      }
    }

    if (Ucase(valor) eq Ucase(dig)){
      return true;
    }
    else {
      return false;
    }
  }
  else {
    return false;
  }
}