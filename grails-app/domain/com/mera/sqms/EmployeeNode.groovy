package com.mera.sqms

class EmployeeNode extends Node {
	
	String firstName
	String lastName	

    static constraints = {
		firstName(size: 2..32, blank: false, nullable: false)
		lastName(size: 2..32, blank: false, nullable: false)		
    }
	
	static belongsTo = [project : ProjectNode]

	@Override
	public String getName() {
		"${firstName} ${lastName}"
	}
	
	@Override
	boolean isLeaf() {
		return true;
	}
	
}
