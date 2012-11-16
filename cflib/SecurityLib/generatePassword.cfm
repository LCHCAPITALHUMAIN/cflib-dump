function generatePassword() {
var placeCharacter = "";
var currentPlace=0;
var group=0;
var subGroup=0;
var numberofCharacters = 8;
var characterFilter = 'O,o,0,i,l,1,I,5,S';
var characterReplace = repeatString(",", listlen(characterFilter)-1);
if(arrayLen(arguments) gte 1) numberofCharacters = val(arguments[1]);
if(arrayLen(arguments) gte 2) {
characterFilter = listsort(rereplace(arguments[2], "([[:alnum:]])", "\1,", "all"),"textnocase");
characterReplace = repeatString(",", listlen(characterFilter)-1);
}
while (len(placeCharacter) LT numberofCharacters) {
group = randRange(1,4, 'SHA1PRNG');
switch(group) {
case "1":
subGroup = rand();
    switch(subGroup) {
case "0":
placeCharacter = placeCharacter & chr(randRange(33,46, 'SHA1PRNG'));
break;
case "1":
placeCharacter = placeCharacter & chr(randRange(58,64, 'SHA1PRNG'));
break;
}
case "2":
placeCharacter = placeCharacter & chr(randRange(97,122, 'SHA1PRNG'));
break;
case "3":
placeCharacter = placeCharacter & chr(randRange(65,90, 'SHA1PRNG'));
break;
case "4":
placeCharacter = placeCharacter & chr(randRange(48,57, 'SHA1PRNG'));
break;
}
if (listLen(characterFilter)) {
placeCharacter = replacelist(placeCharacter, characterFilter, characterReplace);
}
}
return placeCharacter;
}