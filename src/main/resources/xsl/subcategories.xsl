<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="category" />
	<xsl:template match="/shop/category[name='$category']">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Категории</title>
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="subcategory">
	</xsl:template>
</xsl:stylesheet>