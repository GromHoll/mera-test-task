package com.mera.sqms

import java.util.Set;

class UnitNode extends Node {

	String unitName
	
    static constraints = {
		unitName(size: 2..32, blank: false, nullable: false)
    }	
	
	static belongsTo = [organization : OrganizationNode]
	static hasMany = [projects : ProjectNode]
	
	@Override
	public String getName() {
		"${unitName}"
	}
	
	@Override
	Set<Node> getChildren() {
		projects
	}
}
