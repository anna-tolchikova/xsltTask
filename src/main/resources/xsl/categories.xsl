<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:s="http://www.example.org/shop"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
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
				<table>
					<tbody>
						<xsl:apply-templates select="/s:shop/s:category"/>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="s:category">
		<tr class="category">
			<td>
				<xsl:variable name="categoryName" select="s:name" />
				<a href="xsltController?action=subcategories&amp;category={$categoryName}">
					<xsl:value-of select="$categoryName" />
					(subcategories:
					<xsl:value-of select="count(s:subcategory)" />
					)
				</a>
			</td>
		</tr>
	</xsl:template>



</xsl:stylesheet>