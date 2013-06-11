package com.mera.sqms

class TreeGeneratorService {

    public List getTree() {
		List listOfMap = []
		for(OrganizationNode orgNode : OrganizationNode.list()) {
			listOfMap.add(generateNode(orgNode))
		}
		return listOfMap
	}
	
	private Map generateNode(Node node) {
		Map map = [:]
		map.text = node.getName()
		map.id = node.id
		map.leaf = node.isLeaf()
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
