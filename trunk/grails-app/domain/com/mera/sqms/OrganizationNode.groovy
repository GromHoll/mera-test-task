package com.mera.sqms

import java.util.Set;

class OrganizationNode extends Node {

	String orgName
	
    static constraints = {
		orgName(size: 2..32, blank: false, nullable: false)
    }	
	
	static hasMany = [units : UnitNode]

	@Override
	public String getName() {
		"${orgName}"
	}	
	
	@Override
	Set<Node> getChildren() {
		units
	}
}
