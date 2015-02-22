package com.epam.xslt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.epam.xslt.commands.CommandEnum;
import com.epam.xslt.commands.ICommand;
import com.epam.xslt.commands.factory.CommandsFactory;
import com.epam.xslt.exception.CommandException;

public class XsltController extends HttpServlet {

	private static final long serialVersionUID = 3839791172827967957L;
	private static final Logger log = Logger.getLogger(XsltController.class);

	private void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		ICommand command = CommandsFactory.createCommand(req);
		try {
			log.info("EXECUTE");
			command.execute(req, resp);
		} catch (CommandException e) {
			log.error("Error in command execution. " + e);
			throw new ServletException(e); 
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

}
