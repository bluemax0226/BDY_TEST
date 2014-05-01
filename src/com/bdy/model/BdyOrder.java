package com.bdy.model;

// Generated 2014/4/17 �U�� 08:38:49 by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * BdyOrder generated by hbm2java
 */
public class BdyOrder implements java.io.Serializable {

	private int odId;
	private BdyEmp bdyEmp;
	private BdyTable bdyTable;
	private Date ordTime;
	private Set bdyBills = new HashSet(0);
	private Set bdyOrderlists = new HashSet(0);

	public BdyOrder() {
	}

	public BdyOrder(int odId) {
		this.odId = odId;
	}

	public BdyOrder(int odId, BdyEmp bdyEmp, BdyTable bdyTable, Date ordTime,
			Set bdyBills, Set bdyOrderlists) {
		this.odId = odId;
		this.bdyEmp = bdyEmp;
		this.bdyTable = bdyTable;
		this.ordTime = ordTime;
		this.bdyBills = bdyBills;
		this.bdyOrderlists = bdyOrderlists;
	}

	public int getOdId() {
		return this.odId;
	}

	public void setOdId(int odId) {
		this.odId = odId;
	}

	public BdyEmp getBdyEmp() {
		return this.bdyEmp;
	}

	public void setBdyEmp(BdyEmp bdyEmp) {
		this.bdyEmp = bdyEmp;
	}

	public BdyTable getBdyTable() {
		return this.bdyTable;
	}

	public void setBdyTable(BdyTable bdyTable) {
		this.bdyTable = bdyTable;
	}

	public Date getOrdTime() {
		return this.ordTime;
	}

	public void setOrdTime(Date ordTime) {
		this.ordTime = ordTime;
	}

	public Set getBdyBills() {
		return this.bdyBills;
	}

	public void setBdyBills(Set bdyBills) {
		this.bdyBills = bdyBills;
	}

	public Set getBdyOrderlists() {
		return this.bdyOrderlists;
	}

	public void setBdyOrderlists(Set bdyOrderlists) {
		this.bdyOrderlists = bdyOrderlists;
	}

}
