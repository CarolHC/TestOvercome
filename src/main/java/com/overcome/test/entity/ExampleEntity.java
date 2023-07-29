package com.overcome.test.entity;

import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Entity;

@Entity
public class ExampleEntity {

	@Id Long id;
	
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	
}
