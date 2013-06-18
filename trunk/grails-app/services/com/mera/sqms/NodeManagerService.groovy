package com.mera.sqms

import org.springframework.web.context.request.RequestContextHolder;

class NodeManagerService {

    def getInfo(long id) {
		Node node = Node.findById(id)
		
		Map map = getNodeInfo(node)
		map.title = node.getName()
		map.id = node.id
		
		println map
		return map
    }
	
	private def getNodeInfo(OrganizationNode node) {
		Map map = [:]
		map.type = 'org'
		
		map.name = node.orgName		
		map.yearOfCreating = node.yearOfCreating
		map.site = node.site
		map.industry = node.industry
		
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
		map.direction = node.direction		
		
		map.organization = node.organization.getName()
		map.parentId = node.organization.id
		
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
		map.technologies = node.technologies
		map.customer = node.customer
		map.site = node.site		
		
		map.unit = node.unit.getName()
		map.parentId = node.unit.id
		
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
		
		map.city = node.city
		map.street = node.street
		map.home = node.home
		map.apartment = node.apartment
		
		map.phone = node.phone
		map.email = node.email
		
		map.project = node.project.getName()
		map.parentId = node.project.id
				
		return map
	}

	def deleteNode(long id) {
		Node node = Node.findById(id)
		if(node && !node.getClass().equals(OrganizationNode.class)) {
			node.delete()			
		}
	}

	boolean saveNode(Map data) {
		if(data.id) {
			Node node = Node.findById(data.id)
			node.properties = data
			if(node.validate()) {
				node.save()
			} else {
				println node.errors
				return false
			}
		} else {
			Node node
			if(data?.type == 'uni') {
				node = new UnitNode(data)				
			} else if(data?.type == 'pro') {
				node = new ProjectNode(data)	
			} else if(data?.type == 'emp') {
				node = new EmployeeNode(data)	
			}
			if(node.validate()) {
				node.save()
			} else {
				println node.errors
				return false
			}
		}
		
		return true
	}
}
