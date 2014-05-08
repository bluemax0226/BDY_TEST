package com.bdy.controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class test extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void validate() {
		super.validate();
	}
	
	@Override
	public String execute() throws Exception {
		
		return Action.SUCCESS;
	}



	@Override
	public void setSession(Map<String, Object> arg0) {
		
	}

}
