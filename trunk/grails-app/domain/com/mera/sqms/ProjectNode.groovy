package com.mera.sqms

import java.util.Set;

class ProjectNode extends Node {

	String projectName
	
    static constraints = {
		projectName(size: 2..32, blank: false, nullable: false)
    }	
	
	static belongsTo = [unit : UnitNode]
	static hasMany = [employees : EmployeeNode]
	
	@Override
	public String getName() {
		"${projectName}"
	}
	
	@Override
	Set<Node> getChildren() {
		employees;
	}
}
