package com.mera.sqms

import java.util.Set;

class ProjectNode extends Node {

	String projectName
	String technologies
	String customer
	String site
	
    static constraints = {
		projectName(size: 2..32, blank: false, nullable: false)
		site(url: true, nullable: true)
		technologies(nullable: true)
		customer(nullable: true)
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
