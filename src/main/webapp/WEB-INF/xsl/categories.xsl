<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"  encoding="UTF-8"/>
	<xsl:strip-space elements="category" />
	<xsl:template match="text()">
		<xsl:value-of select="normalize-space()" />
	</xsl:template>
	<xsl:template match="/">

		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Категории</title>
				<style type="text/css">
					td {
					text-align: left;
					}

					.category {
					font-size:larger;
					font-weight: bolder;
					}
				</style>
			</head>
			<body>
			<h1>Категории товаров:</h1>
				<table>
					<tbody>
						<xsl:apply-templates select="/shop/category" />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="category">
		<tr class="category">
			<td>
				<xsl:variable name="categoryName" select="name" />
				<a
					href="controller?action=subcategories&amp;category={$categoryName}">
					<xsl:value-of select="$categoryName" />
					(продуктов:
					<xsl:value-of select="count(.//product)" />
					)
				</a>
			</td>
		</tr>
	</xsl:template>



</xsl:stylesheet>