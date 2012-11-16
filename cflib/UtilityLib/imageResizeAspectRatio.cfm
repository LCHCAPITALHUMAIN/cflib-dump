function imageResizeAspectRatio(originalWidth,originalHeight,target){
	var width		= 0;
	var height		= 0;
	var percentage	= 0;
	var imageProperties	= structnew();

	percentage = (target / originalHeight);
	if (originalWidth gt originalHeight) { 
		percentage = (target / originalWidth);
	}
	
	newWidth				= round(originalWidth * percentage);
	newHeight				= round(originalHeight * percentage);
	imageProperties.width	= newWidth;
	imageProperties.height	= newHeight;
	
	return imageProperties;		
}