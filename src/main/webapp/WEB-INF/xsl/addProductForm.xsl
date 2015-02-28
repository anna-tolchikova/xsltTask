<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:param name="category" />
	<xsl:param name="subcategory" />
	<xsl:param name="name" />
	<xsl:param name="producer" />
	<xsl:param name="model" />
	<xsl:param name="day" />
	<xsl:param name="month" />
	<xsl:param name="year" />
	<xsl:param name="color" />
	<xsl:param name="price" />
	<xsl:param name="in_stock" />





	<xsl:output method="html" encoding="UTF-8" />

	<xsl:template match="/">

		<xsl:call-template name="addProductForm" />

	</xsl:template>


	<xsl:template name="addProductForm">
		<xsl:param name="nameErr" />
		<xsl:param name="producerErr" />
		<xsl:param name="modelErr" />
		<xsl:param name="dateErr" />
		<xsl:param name="colorErr" />
		<xsl:param name="priceErr" />
		<xsl:param name="inStockErr" />

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
							<td style="color: red;">
								<xsl:if test="$nameErr">
									<xsl:value-of select="$nameErr" />
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td>Производитель</td>
							<td>
								<input type="text" name="producer" value="{$producer}" />
							</td>
							<td style="color: red;">
								<xsl:if test="$producerErr">
									<xsl:value-of select="$producerErr" />
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td>Модель</td>
							<td>
								<input type="text" name="model" value="{$model}" />
							</td>
							<td style="color: red;">
								<xsl:if test="$modelErr">
									<xsl:value-of select="$modelErr" />
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td>Дата производства</td>
							<td>
								День:
								<select name="day">
									<xsl:for-each select="1 to 31">
										<xsl:variable name="opt" select="." />
										<xsl:choose>
											<xsl:when test="string($opt) = $day">
												<option value="{$opt}" selected="true">
													<xsl:value-of select="$opt" />
												</option>
											</xsl:when>
											<xsl:otherwise>
												<option value="{$opt}">
													<xsl:value-of select="$opt" />
												</option>
											</xsl:otherwise>
										</xsl:choose>


									</xsl:for-each>
								</select>
								Месяц:
								<select name="month">
									<xsl:for-each select="1 to 12">
										<xsl:variable name="opt" select="." />
										<option value="{$opt}">
											<xsl:value-of select="$opt" />
										</option>
									</xsl:for-each>
								</select>
								Год:
								<select name="year">
									<xsl:for-each select="2000 to 2015">
										<xsl:variable name="opt" select="." />
										<option value="{$opt}">
											<xsl:value-of select="$opt" />
										</option>
									</xsl:for-each>
								</select>
							</td>
							<td style="color: red;">
								<xsl:if test="$dateErr">
									<xsl:value-of select="$dateErr" />
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td>Цвет</td>
							<td>
								<input type="text" name="color" value="{$color}" />
							</td>
							<td style="color: red;">
								<xsl:if test="$colorErr">
									<xsl:value-of select="$colorErr" />
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td>Цена</td>
							<td>
								<input type="text" name="price" value="{$price}" />
							</td>
							<td style="color: red;">
								<xsl:if test="$priceErr">
									<xsl:value-of select="$priceErr" />
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td>В наличии</td>
							<td>
								<select name="in_stock">
									<option value="true" selected="true">есть</option>
									<option value="false">нет</option>
								</select>
							</td>
							<td style="color: red;">
								<xsl:if test="$inStockErr">
									<xsl:value-of select="$inStockErr" />
								</xsl:if>
							</td>
						</tr>

					</table>
					<br />
					<input type="hidden" name="action" value="save" />
					<input type="hidden" name="category" value="{$category}" />
					<input type="hidden" name="subcategory" value="{$subcategory}" />
					<input type="submit" value="Сохранить" />
					<br />
					<a
						href="controller?action=products&amp;category={$category}&amp;subcategory={$subcategory}">Назад</a>
				</form>
			</body>
		</html>
	</xsl:template>


</xsl:stylesheet>