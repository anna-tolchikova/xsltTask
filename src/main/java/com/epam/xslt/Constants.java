package com.epam.xslt;

public class Constants {

	// Request parameters names
	public final static String REQ_COMMAND_PARAM = "action";
	public final static String REQ_CATEGORY_PARAM = "category";
	public final static String REQ_SUBCATEGORY_PARAM = "subcategory";
	public final static String REQ_NAME_PARAM = "name";
	public final static String REQ_PRODUCER_PARAM = "producer";
	public final static String REQ_MODEL_PARAM = "model";
	public final static String REQ_DAY_PARAM = "day";
	public final static String REQ_MONTH_PARAM = "month";
	public final static String REQ_YEAR_PARAM = "year";
	public final static String REQ_COLOR_PARAM = "color";
	public final static String REQ_PRICE_PARAM = "price";
	public final static String REQ_IN_STOCK_PARAM = "in_stock";
	
	// Error pages paths constants
	public final static String ERROR400_PATH = "/jsp/error400.jsp";
	public final static String ERROR500_PATH = "/jsp/error500.jsp";
	
	// Resources paths constants
	public final static String XML_SHOP_PATH = "/WEB-INF/xml/shop.xml";
	public final static String XSL_CATEGORIES_PATH = "/WEB-INF/xsl/categories.xsl";
	public final static String XSL_SUBCATEGORIES_PATH = "/WEB-INF/xsl/subcategories.xsl";
	public final static String XSL_PRODUCTS_PATH = "/WEB-INF/xsl/products.xsl";
	public final static String XSL_ADD_PRODUCT_PATH = "/WEB-INF/xsl/addProductForm.xsl";
	public final static String XSL_VALIDATE_SAVE_PRODUCT_PATH = "/WEB-INF/xsl/validateAndSave.xsl";
	

}
