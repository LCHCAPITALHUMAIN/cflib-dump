function SpaceCap(text) {
  return REReplace(text, "([.^[:upper:]])", " \1","all");
}