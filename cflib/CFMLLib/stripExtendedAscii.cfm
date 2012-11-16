function stripExtendedAscii(str) {
  return reReplace(arguments.str, "[^\x20-\x7E]", "", "ALL"); // 0x20 = space, chr(32); \0x7E = ~ / tilde, chr(126)
};