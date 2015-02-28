package com.epam.xslt.commands.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.TransformerException;

import org.apache.log4j.Logger;

import com.epam.xslt.Constants;
import com.epam.xslt.commands.ICommand;
import com.epam.xslt.exception.CommandException;
import com.epam.xslt.transformer.TransformManager;

public class SaveProductCommand extends BaseCommand implements ICommand {

	private final static Logger log = Logger.getLogger(SaveProductCommand.class);

	public SaveProductCommand() {

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws CommandException {

		String xmlPath = req.getServletContext().getRealPath(
				Constants.XML_SHOP_PATH);
		String xslPath = req.getServletContext().getRealPath(
				Constants.XSL_VALIDATE_SAVE_PRODUCT_PATH);

		String inCategory = (String) req.getParameter(Constants.REQ_CATEGORY_PARAM);
		String inSubcategory = (String) req.getParameter(Constants.REQ_SUBCATEGORY_PARAM);
		
		
		if (inCategory == null || inCategory.isEmpty() || inSubcategory == null || inSubcategory.isEmpty()) {
			throw new CommandException("User param 'category' and 'subcategory' are required.");
		}
		
		String name = (String) req.getParameter(Constants.REQ_NAME_PARAM);
		String producer = (String) req.getParameter(Constants.REQ_PRODUCER_PARAM);
		String model = (String) req.getParameter(Constants.REQ_MODEL_PARAM);
		String day = (String) req.getParameter(Constants.REQ_DAY_PARAM);
		String month = (String) req.getParameter(Constants.REQ_MONTH_PARAM);
		String year = (String) req.getParameter(Constants.REQ_YEAR_PARAM);
		String color = (String) req.getParameter(Constants.REQ_COLOR_PARAM);
		String price = (String) req.getParameter(Constants.REQ_PRICE_PARAM);
		String inStock = (String) req.getParameter(Constants.REQ_IN_STOCK_PARAM);
		
		
		log.info("PARAM category = " + inCategory);
		log.info("PARAM in_stock = " + inStock);
		
		HashMap<String, String> params  = new HashMap<>();
		params.put(Constants.REQ_CATEGORY_PARAM, inCategory);
		params.put(Constants.REQ_SUBCATEGORY_PARAM, inSubcategory);
		params.put(Constants.REQ_NAME_PARAM, name);
		params.put(Constants.REQ_PRODUCER_PARAM, producer);
		params.put(Constants.REQ_MODEL_PARAM, model);
		params.put(Constants.REQ_DAY_PARAM, day);
		params.put(Constants.REQ_MONTH_PARAM, month);
		params.put(Constants.REQ_YEAR_PARAM, year);
		params.put(Constants.REQ_COLOR_PARAM, color);
		params.put(Constants.REQ_PRICE_PARAM, price);
		params.put(Constants.REQ_IN_STOCK_PARAM, inStock);
		PrintWriter out = getOutputWriter(resp);
		readLock.lock();
		try {
			TransformManager.transform(xmlPath, xslPath, out, params);
		} catch (TransformerException e) {
			throw new CommandException("Error during xsl transformation. " + e);
		} finally {
			readLock.unlock();
		}

	}

}
