<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="category" />
	<xsl:output method="html" encoding="UTF-8"/>
	<xsl:strip-space elements="subcategory" />
	<xsl:template match="text()">
		<xsl:value-of select="normalize-space()" />
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title><xsl:value-of select="$category"/></title>
			</head>
			<body>
				<h1>Подкатегории в категории: <xsl:value-of select="$category"/></h1>
				<table>
					<xsl:apply-templates
						select="/shop/category[name = $category]/subcategory" />
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="subcategory">
		<tr>
			<td>
				<xsl:variable name="subcategoryName" select="name" />
				<a
					href="controller?action=products&amp;category={$category}&amp;subcategory={$subcategoryName}">
					<xsl:value-of select="$subcategoryName" />
					(продуктов: 
					<xsl:value-of select="count(product)" />
					)
				</a>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>