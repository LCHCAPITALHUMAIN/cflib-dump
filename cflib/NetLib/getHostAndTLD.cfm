function getHostAndTLD(domain) {
var result=structnew();
if (len(domain) lte 0) return false;
       result.hostname=listfirst(domain,".");
       if(listlen(domain,".") gt 2){
               result.tld=listgetat(domain,2,".")&"."&listgetat(domain,3,".");
               }
       else{
               result.tld=listlast(domain,".");
               }
       return result;
}