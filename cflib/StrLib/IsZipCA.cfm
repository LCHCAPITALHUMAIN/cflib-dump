function IsZipCA(str) {
 return REFind('^[A-CEG-NPR-TVXYa-ceg-npr-tvxy][[:digit:]][A-CEG-NPR-TVW-Za-ceg-npr-tvw-z]( |-)?[[:digit:]][A-CEG-NPR-TVW-Za-ceg-npr-tvw-z][[:digit:]]$', str);
}