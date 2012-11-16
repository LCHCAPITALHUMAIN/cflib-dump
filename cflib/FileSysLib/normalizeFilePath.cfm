function normalizeFilePath(filePath) {
return CreateObject("java","java.io.File").init(filePath).getCanonicalPath();
}