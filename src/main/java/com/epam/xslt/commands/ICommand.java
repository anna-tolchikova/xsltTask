package com.epam.xslt.commands;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epam.xslt.exception.CommandException;

public interface ICommand {
	void execute(HttpServletRequest req, HttpServletResponse resp)
			throws CommandException;

	default PrintWriter getOutputWriter(HttpServletResponse resp)
			throws CommandException {
		PrintWriter out = null;
		try {
			resp.setCharacterEncoding("UTF-8");
			out = resp.getWriter();
			
		} catch (IOException e) {
			throw new CommandException(
					"Error in getting writer from response object. " + e);
		}
		
		return out;
	}
}
