package com.overcome.test.functions;

import java.util.logging.Logger;

import com.overcome.test.ServiceFactory;
import com.overcome.test.service.ExampleEntityService;

public class ExampleEntityFunctions {
	private ExampleEntityService exampleEntityService = ServiceFactory.getInstance().getExampleEntityService();
	private static final Logger logger = Logger.getLogger(ExampleEntityFunctions.class.getName());
	
	
}
