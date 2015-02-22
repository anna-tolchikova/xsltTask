<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="category" />
	<xsl:param name="subcategory" />
	<xsl:param name="name" />
	<xsl:param name="producer" />
	<xsl:param name="model" />
	<xsl:param name="date_of_issue" />
	<xsl:param name="day" />
	<xsl:param name="month" />
	<xsl:param name="year" />
	<xsl:param name="color" />
	<xsl:param name="price" />
	<xsl:param name="not_in_stock" />
	<xsl:param name="producerError" />
	<xsl:param name="modelError" />
	<xsl:param name="date_of_issueError" />
	<xsl:param name="colorError" />
	<xsl:param name="priceError" />

	<xsl:output method="html" />
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
				<title>Добавление продукта</title>
			</head>
			
			<body>
			<h1>
				Добавление продукта:

			</h1>
			<h2>
				<xsl:value-of select="$category" />
				/
				<xsl:value-of select="$subcategory" />
			</h2>
				<form name="addProductForm" action="controller" method="POST">
					<table>
						<tr>
							<td>Название</td>
							<td>
								<input type="text" name="name" value="{$name}" />
							</td>
						</tr>
						<tr>
							<td>Производитель</td>
							<td>
								<input type="text" name="producer" value="{$producer}" />
							</td>
						</tr>
						<tr>
							<td>Модель</td>
							<td>
								<input type="text" name="model" value="{$model}" />
							</td>
						</tr>
						<tr>
							<td>Дата производства</td>
							<td>
								День:
								<select name="day">
								<xsl:for-each select="1 to 31">
									<xsl:variable name="opt" select="."/>
									<option value="{$opt}"><xsl:value-of select="$opt"/></option>
								</xsl:for-each>
								</select>
								Месяц:
								<select name="month">
								<xsl:for-each select="1 to 12">
									<xsl:variable name="opt" select="." /> 
									<option value="{$opt}"><xsl:value-of select="$opt"/></option>
								</xsl:for-each>
								</select>
								Год:
								<select name="year">
								<xsl:for-each select="2000 to 2015">
									<xsl:variable name="opt" select="." /> 
									<option value="{$opt}"><xsl:value-of select="$opt"/></option>
								</xsl:for-each>
								</select>
							</td>
						</tr>
						<tr>
							<td>Цвет</td>
							<td><input type="text" name="color" value="{$color}" /></td>
						</tr>
						<tr>
							<td>Цена</td>
							<td><input type="text" name="price" value="{$price}" /></td>
						</tr>
						<tr>
							<td>В наличии</td>
							<td><select name="in_stock">
							<option value="true" selected="true">есть</option>
							<option value="false">нет</option>
							</select></td>
						</tr>
						
					</table>
					<br />
					<input type="hidden" name="category" value="{$category}" />
					<input type="hidden" name="subcategory" value="{$subcategory}" />
					<input type="submit" value="Добавить продукт" />
				</form>
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>