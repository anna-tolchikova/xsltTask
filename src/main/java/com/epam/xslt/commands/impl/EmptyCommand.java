package com.epam.xslt.commands.impl;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.epam.xslt.commands.ICommand;
import com.epam.xslt.exception.CommandException;

public class EmptyCommand  extends BaseCommand implements ICommand{
	private final static Logger log = Logger.getLogger(EmptyCommand.class);
	public EmptyCommand(){
		
	}
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws CommandException {
		try {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
		} catch (IOException e) {
			log.error("IOException with 400 answer");
			throw new CommandException(e);
		}
	}

}
