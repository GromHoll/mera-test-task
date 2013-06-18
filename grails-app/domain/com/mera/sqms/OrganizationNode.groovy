package com.mera.sqms

import java.util.Set;

class OrganizationNode extends Node {

	String orgName
	Integer yearOfCreating
	String site
	String industry
	
    static constraints = {
		orgName(size: 2..32, blank: false, nullable: false)
		yearOfCreating(range: 1900..2100, nullable: true)
		industry(nullable: true)
		site(url: true, nullable: true)
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
