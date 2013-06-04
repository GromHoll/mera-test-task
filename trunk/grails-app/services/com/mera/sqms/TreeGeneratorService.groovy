package com.mera.sqms

class TreeGeneratorService {

    String getTreeAsJson() {
		def json = new groovy.json.JsonBuilder()
		return getTree(json)
    }
	
	private String getTree(Object builder) {				
		List listOfMap = generateTree()		
		builder.call(listOfMap)		
		
		def out = new StringWriter()
		out << builder
		println out.toString()
		
		return out.toString()
	}
	
	private List generateTree() {
		List listOfMap = []
		for(OrganizationNode orgNode : OrganizationNode.list()) {
			listOfMap.add(generateNode(orgNode))
		}
		return listOfMap
	}
	
	private Map generateNode(Node node) {
		Map map = [:]
		map.type = "text"
		map.id = node.id
		map.label = node.getName()
		map.expanded = true
		
		List l = []
		for(Node child : node.getChildren()) {
			l.add(generateNode(child))
		}
		if(l) {
			map.children = l
		}
		
		return map
	}
}
