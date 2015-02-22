package com.epam.xslt.transformer;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.log4j.Logger;

public final class TransformManager {

	private final static Logger log = Logger.getLogger(TransformManager.class);
	private final static TransformerFactory transFact = TransformerFactory
			.newInstance();
	private static HashMap<String, Templates> templatesMap = new HashMap<>();

	public static void transform(String sourceXml, String xslPath,
			PrintWriter out, HashMap<String, String> params) throws TransformerException {

		Transformer tramsformer = createTransformer(xslPath, params);
		Source source = new StreamSource(sourceXml);
		StreamResult result = new StreamResult(out);
		tramsformer.transform(source, result);

	}

	private static Transformer createTransformer(String xslPath, HashMap<String, String> params) {

		Transformer transformer = null;
		if (xslPath == null || xslPath.isEmpty()) {
			throw new IllegalArgumentException(
					"Path to xsl cannot be null or empty");
		}
		Templates template = templatesMap.get(xslPath);
		if (template == null) {
			Source xslSource = new StreamSource(xslPath);
			try {
				template = transFact.newTemplates(xslSource);
				templatesMap.put(xslPath, template);
			} catch (TransformerConfigurationException e) {
				log.error("Error during xsl parsing. " + e);
				return transformer;
			}
		}
		try {
			transformer = template.newTransformer();
		} catch (TransformerConfigurationException e) {
			log.error("Error during transformer creation. " + e);
		}
		
		if (params != null && !params.isEmpty()) {
			fillParams(transformer, params);
		}

		return transformer;

	}
	
	private static void fillParams(Transformer transformer, HashMap<String, String> params) {
		for (String key : new ArrayList<String>(params.keySet())) {
			transformer.setParameter(key, (String)params.get(key));
		}
		
	}

}
