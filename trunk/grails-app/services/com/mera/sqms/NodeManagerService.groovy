package com.mera.sqms

class NodeManagerService {

    def getInfo(long id) {
		Node node = Node.findById(id)
		
		Map map = getNodeInfo(node)
		map.title = node.getName()
		map.id = node.id
		
		return map
    }
	
	private def getNodeInfo(OrganizationNode node) {
		Map map = [:]
		map.type = 'org'
		map.name = node.orgName
		
		List units = []
		for(Node n : node.getChildren())
			units.add(n.getName())
		map.units = units
		
		return map
	}
	
	private def getNodeInfo(UnitNode node) {
		Map map = [:]
		map.type = 'uni'
		map.name = node.unitName
		map.organization = node.organization.getName()
		
		List projects = []
		for(Node n : node.getChildren())
			projects.add(n.getName())
		map.projects = projects
		
		return map
	}
	
	private def getNodeInfo(ProjectNode node) {
		Map map = [:]
		map.type = 'pro'
		map.name = node.projectName
		map.unit = node.unit.getName()
		
		List employees = []
		for(Node n : node.getChildren()) {
			employees.add(n.getName())
		}
		map.employees = employees
		
		return map
	}
	
	private def getNodeInfo(EmployeeNode node) {
		Map map = [:]
		map.type = 'emp'
		map.firstName = node.firstName
		map.lastName = node.lastName
		map.project = node.project.getName()
				
		return map
	}

	def deleteNode(long id) {
		Node node = Node.findById(id)
		if(node && !node.getClass().equals(OrganizationNode.class)) {
			node.delete()			
		}
	}
}
