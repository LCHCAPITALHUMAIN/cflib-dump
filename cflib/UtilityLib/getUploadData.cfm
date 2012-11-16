function getUploadData() {
  var local = {};
  local.result = {};
  if (cgi.request_method Eq 'post') {
    local.uploads = form.getPartsArray();
    if (StructKeyExists(local, 'uploads')) {
      local.count = ArrayLen(local.uploads);
      for (local.u = 1; local.u Lte local.count; local.u++) {
        local.info = GetFileInfo(form[local.uploads[local.u].getName()]);
        local.result[local.uploads[local.u].getName()] = {
          tempFileName = form[local.uploads[local.u].getName()],
          originalName = local.uploads[local.u].getFileName(),
          contentType = local.uploads[local.u].getContentType(),
          filesize = local.info.size,
          ext = ListLast(local.uploads[local.u].getFileName(), '.')
        };
      }
    }
  }
  return local.result;
}