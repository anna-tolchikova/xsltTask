package com.epam.xslt.commands.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.TransformerException;

import com.epam.xslt.Constants;
import com.epam.xslt.commands.ICommand;
import com.epam.xslt.exception.CommandException;
import com.epam.xslt.transformer.TransformManager;

public class SubcategoriesCommand extends BaseCommand implements ICommand {

	public SubcategoriesCommand() {

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws CommandException {
		
		String xmlPath = req.getServletContext().getRealPath(
				Constants.XML_SHOP_PATH);
		String xslPath = req.getServletContext().getRealPath(
				Constants.XSL_SUBCATEGORIES_PATH);
		
		String inCategory = (String) req.getParameter(Constants.REQ_CATEGORY_PARAM);
		
		if ( inCategory == null || inCategory.isEmpty()) {
			throw new CommandException("User param 'category' is required.");
		}
		HashMap<String, String> params  = new HashMap<>();
		params.put(Constants.REQ_CATEGORY_PARAM, inCategory);
		PrintWriter out = getOutputWriter(resp);
		readLock.lock();
		try {
			try {
				TransformManager.transform(xmlPath, xslPath, out, params);
			} catch (TransformerException e) {
				throw new CommandException("Error during xsl transformation. " + e);
			}
		} finally {
			readLock.unlock();
		}

	}

}
