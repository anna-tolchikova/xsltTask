package com.epam.xslt.commands.factory;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.epam.xslt.Constants;
import com.epam.xslt.commands.CommandEnum;
import com.epam.xslt.commands.ICommand;

public class CommandsFactory {
	
	private final static Logger log = Logger.getLogger(CommandsFactory.class);

	public static ICommand createCommand (HttpServletRequest req) {
		
		String command = req.getParameter(Constants.REQ_COMMAND_PARAM);
		CommandEnum validCommand = CommandEnum.EMPTY;
		if (command == null || command.isEmpty()) {
			log.error("Empty command from user");
				return validCommand.getCommand();
		}
		
		try {
			validCommand = CommandEnum.valueOf(command.toUpperCase());
		} catch (IllegalArgumentException e) {
			log.error("Wrong (not existing) command from user");
			return validCommand.getCommand();
		}
				
		return validCommand.getCommand();
	}
}
