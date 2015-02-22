package com.epam.xslt.commands.impl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.TransformerException;

import org.apache.log4j.Logger;

import com.epam.xslt.Constants;
import com.epam.xslt.commands.ICommand;
import com.epam.xslt.exception.CommandException;
import com.epam.xslt.transformer.TransformManager;

public class CategoriesCommand extends BaseCommand implements ICommand {

	private final static Logger log = Logger.getLogger(CategoriesCommand.class);

	public CategoriesCommand() {

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws CommandException {

		String xmlPath = req.getServletContext().getRealPath(
				Constants.XML_SHOP_PATH);
		String xslPath = req.getServletContext().getRealPath(
				Constants.XSL_CATEGORIES_PATH);
		PrintWriter out = getOutputWriter(resp);
		readLock.lock();
		try {
			TransformManager.transform(xmlPath, xslPath, out, null);
		} catch (TransformerException e) {
			throw new CommandException("Error during xsl transformation. " + e);
		} finally {
			readLock.unlock();
		}

	}

}
