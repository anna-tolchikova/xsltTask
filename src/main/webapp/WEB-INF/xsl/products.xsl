<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:param name="category" />
	<xsl:param name="subcategory" />
	<xsl:output method="html" />
	<xsl:strip-space elements="product" />
	<xsl:template match="text()">
		<xsl:value-of select="normalize-space()" />
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>{$subcategory}</title>
			</head>
			<h1>Категория: <xsl:value-of select="$category" /></h1>
			<h2>Подкатегория: <xsl:value-of select="$subcategory" /></h2>
			<body>
				<table>
					<tr>
						<td>Продукт</td>
						<td>Производитель</td>
						<td>Модель</td>
						<td>Дата производства</td>
						<td>Цвет</td>
						<td>Цена</td>
					</tr>
					<xsl:apply-templates
						select="/shop/category[name = $category]/subcategory[name = $subcategory]/product[@in_stock='true']" />
				</table>
				<br />
				<a href="controller?action=add&amp;category={$category}&amp;subcategory={$subcategory}">
					<input type="button" value="Добавить продукт" />
				</a>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="product">
		<tr>
			<td>
				<xsl:value-of select="name" />
			</td>
			<td>
				<xsl:value-of select="producer" />
			</td>
			<td>
				<xsl:value-of select="model" />
			</td>
			<td>
				<xsl:value-of select="substring(date_of_issue/day, 4)" />
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(date_of_issue/month, 3)" />
				<xsl:text>/</xsl:text>
				<xsl:value-of select="date_of_issue/year" />
			</td>
			<td>
				<xsl:value-of select="color" />
			</td>
			<td>
				<xsl:value-of select="price" />

			</td>
		</tr>
	</xsl:template>


</xsl:stylesheet>