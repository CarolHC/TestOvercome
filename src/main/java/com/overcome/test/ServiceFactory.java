package com.overcome.test;

import com.overcome.test.service.ExampleEntityService;

public class ServiceFactory {

	protected static volatile ServiceFactory instance;
	protected ServiceFactory() {}
	
	public static ServiceFactory getInstance() {
		if (instance == null) {
			synchronized (ServiceFactory.class) {
				instance = new ServiceFactory();
			}
		}
		return instance;
	}
	
	private ExampleEntityService exampleEntityService;
	
	public void setExampleEntityService(ExampleEntityService exampleEntityService) {
		this.exampleEntityService = exampleEntityService;
	}
	public ExampleEntityService getExampleEntityService() {
		return exampleEntityService;
	}
}
