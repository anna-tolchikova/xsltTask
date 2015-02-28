<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="addProductForm.xsl" />
	<xsl:import href="saveProduct.xsl" />


	<xsl:param name="nameErr">
		<xsl:if test="not(matches($name, '\w+'))">
			Name cannot be empty
		</xsl:if>
	</xsl:param>

	<xsl:param name="producerErr">
		<xsl:if test="not(matches($producer, '\w+'))">
			Producer cannot be empty
		</xsl:if>
	</xsl:param>

	<xsl:param name="modelErr">
		<xsl:if test="not(matches($model, '\w{2}\d{3}'))">
			Model cannot be empty and match mask
		</xsl:if>
	</xsl:param>

	<xsl:param name="dateErr">
		<xsl:choose>
			<xsl:when test="not(matches($day, '[1-31]'))">
				Day cannot be empty
			</xsl:when>
			<xsl:when test="not(matches($month, '[1-12]'))">
				Month cannot be empty
			</xsl:when>
			<xsl:when test="not(matches($year, '[2000-2015]'))">
				Year cannot be empty (2000-2015)
			</xsl:when>
		</xsl:choose>
	</xsl:param>

	<xsl:param name="colorErr">
		<xsl:if test="not(matches($color, '[a-zA-Z]+'))">
			Color cannot be empty
		</xsl:if>
	</xsl:param>

	<xsl:param name="priceErr">
		<xsl:if test="not(matches($price, '\d+'))">
			Price cannot be empty or contain symbols
		</xsl:if>
	</xsl:param>

	<xsl:param name="inStockErr">
		<xsl:if test="not(matches($in_stock, 'true|false'))">
			'In stock' cannot be empty
		</xsl:if>
	</xsl:param>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when
				test="$nameErr !='' or $producerErr != '' or $modelErr !='' or $dateErr !='' or $colorErr!='' or $inStockErr!='' or $priceErr!=''">
				<xsl:call-template name="addProductForm">
					<xsl:with-param name="nameErr" select="$nameErr" />
					<xsl:with-param name="producerErr" select="$producerErr" />
					<xsl:with-param name="modelErr" select="$modelErr" />
					<xsl:with-param name="dateErr" select="$dateErr" />
					<xsl:with-param name="colorErr" select="$colorErr" />
					<xsl:with-param name="inStockErr" select="$inStockErr" />
					<xsl:with-param name="priceErr" select="$priceErr" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="saveProduct" />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>



</xsl:stylesheet>