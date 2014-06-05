package com.bdy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.bdy.model.BdyDiscount;
import com.bdy.model.BdyMainkind;
import com.bdy.model.BdyMakearea;
import com.bdy.model.BdySet;
import com.bdy.service.ManageService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ManageInsertSetAction extends ActionSupport implements Preparable , ServletRequestAware{

	private String setName;
	private Double setPrice;
	List<BdyDiscount> disc;
	List<BdySet> set;
	List<BdyMakearea> ma;
	List<BdyMainkind> mk ;
	ManageService service;
	HttpServletRequest request;
	
	
	public List<BdyMainkind> getMk() {
		return mk;
	}

	public void setMk(List<BdyMainkind> mk) {
		this.mk = mk;
	}

	public List<BdyDiscount> getDisc() {
		return disc;
	}

	public void setDisc(List<BdyDiscount> disc) {
		this.disc = disc;
	}

	public List<BdySet> getSet() {
		return set;
	}

	public void setSet(List<BdySet> set) {
		this.set = set;
	}

	public List<BdyMakearea> getMa() {
		return ma;
	}

	public void setMa(List<BdyMakearea> ma) {
		this.ma = ma;
	}

	public String getSetName() {
		return setName;
	}

	public void setSetName(String setName) {
		this.setName = setName;
	}

	public Double getSetPrice() {
		return setPrice;
	}

	public void setSetPrice(Double setPrice) {
		this.setPrice = setPrice;
	}

	@Override
	public void validate() {
		if(setName==null||setName.trim().length()==0){
			this.addFieldError("setName",this.getText("set.setName.required"));
		}
		if(setPrice==null||setPrice==0){
			this.addFieldError("setPrice",this.getText("set.setPrice.required"));
		}
		
	}
	
	@Override
	public String execute() throws Exception {
		service.insideInsertSet(setName, setPrice);
		disc = service.getAllDiscount();
		set = service.getAllSet();
		ma= service.getAllMakeArea();
		mk=service.getAllMainKind();
		return Action.SUCCESS;
	}

	@Override
	public void prepare() throws Exception {
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(ServletActionContext.getServletContext());
		service = (ManageService)context.getBean("ManageService");
		
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

	

}
