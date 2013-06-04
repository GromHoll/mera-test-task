package com.mera.sqms

class MainViewController {

	def treeGeneratorService
	
    def index() {
		String tree = treeGeneratorService.getTreeAsJson()
		["treeData" : tree]
	}
	
	def deleteNode(Long id) {
		Node node = Node.get(id)
		def result = [:]
		if(node && !node.getClass().equals(OrganizationNode.class)) {
			render(contentType: 'text/json') {[ 'status': "OK" ]}
		} else {
			render(status: 503, text: 'Failed to do stuff.')
		}
	}
	
	def showNode(Long id) {
		
	}
	
}
