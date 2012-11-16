function bhimginfo(imgfile) {
	var jFileIn = createObject("java","java.io.File").init(imgfile);
	var ImageObject = createObject("java","javax.imageio.ImageIO").read(jFileIn);
	var ImageInfo = StructNew();
	
	var imageFile = CreateObject("java", "java.io.File").init(imgfile); 
	var sizeb = imageFile.length();
	var sizekb = numberformat(sizeb / 1024, "999999999.99");
	var sizemb = numberformat(sizekb / 1024, "99999999.99");
	var bhImageInfo = StructNew();

	bhImageInfo.ImgWidth = ImageObject.getWidth();
	bhImageInfo.ImgHeight = ImageObject.getHeight();
	bhImageInfo.SizeB = sizeb;
	bhImageInfo.SizeKB = sizekb;
	bhImageInfo.SizeMB = sizemb;
	
	return bhImageInfo;
}