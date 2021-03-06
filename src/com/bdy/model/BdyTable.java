package com.bdy.model;

// Generated 2014/4/17 �U�� 08:38:49 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * BdyTable generated by hbm2java
 */
public class BdyTable implements java.io.Serializable {

	private int tbId;
	private String name;
	private Integer tableState;
	private Integer size;
	private String location;
	private Integer bdyFloor;
	private Set bdyOrders = new HashSet(0);

	public BdyTable() {
	}

	public BdyTable(int tbId) {
		this.tbId = tbId;
	}

	public BdyTable(int tbId, String name, Integer tableState, Integer size,
			String location, Integer bdyFloor, Set bdyOrders) {
		this.tbId = tbId;
		this.name = name;
		this.tableState = tableState;
		this.size = size;
		this.location = location;
		this.bdyFloor = bdyFloor;
		this.bdyOrders = bdyOrders;
	}

	public int getTbId() {
		return this.tbId;
	}

	public void setTbId(int tbId) {
		this.tbId = tbId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getTableState() {
		return this.tableState;
	}

	public void setTableState(Integer tableState) {
		this.tableState = tableState;
	}

	public Integer getSize() {
		return this.size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getBdyFloor() {
		return this.bdyFloor;
	}

	public void setBdyFloor(Integer bdyFloor) {
		this.bdyFloor = bdyFloor;
	}

	public Set getBdyOrders() {
		return this.bdyOrders;
	}

	public void setBdyOrders(Set bdyOrders) {
		this.bdyOrders = bdyOrders;
	}

}
