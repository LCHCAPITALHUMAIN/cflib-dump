function IsAlphabet(str) {
    return not reFindNoCase("[^a-z\.[:space:]]",str);
}