function fncFileSize(size) {
	if (size lt 1024) return "#size# b";
	if (size lt 1024^2) return "#round(size / 1024)# Kb";
	if (size lt 1024^3) return "#decimalFormat(size/1024^2)# Mb";
	return "#decimalFormat(size/1024^3)# Gb";
}