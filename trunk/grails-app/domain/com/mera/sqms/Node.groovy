package com.mera.sqms

class Node {
	
	int id

    static constraints = {
		id(unique: true, nullable: false)
    }
	
	static mapping = {
		id generator: 'increment'
	}
	
	String toString() {
		getName() + " (${id})"
	}
	
	String getName() {
		return ""
	}
	
	Set<Node> getChildren() {
		return new HashSet<Node>();
	}
	
	boolean isLeaf() {
		return false;
	}
}
