package com.mera.sqms

class EmployeeNode extends Node {
	
	String firstName
	String lastName
	
	String city
	String street
	String home
	String apartment
	
	String phone
	String email

    static constraints = {
		firstName(size: 2..32, blank: false, nullable: false)
		lastName(size: 2..32, blank: false, nullable: false)
		
		city(nullable: true)
		street(nullable: true)
		home(nullable: true)
		apartment(nullable: true)		
		
		phone(nullable: true)
		email(email: true, nullable: true)
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
