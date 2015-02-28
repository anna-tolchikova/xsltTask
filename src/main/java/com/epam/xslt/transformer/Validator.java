package com.epam.xslt.transformer;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

public class Validator {
	
	private final static Logger log = Logger.getLogger(Validator.class);
	
	public static boolean matchMask (String value, String mask) {
		boolean isValid = true;
		Pattern pattern = Pattern.compile(mask);
		Matcher matcher = pattern.matcher(value);
		if (!matcher.find()) {
			isValid = false;
		}
		
		log.info("value = '" + value + "'" + " mask = '" + mask + "'");
		
		return isValid;
	}
	

}
