package com.mera.sqms

import grails.converters.JSON

class MainViewController {

	def treeGeneratorService
	def nodeManagerService
	
    def index() {
		def tree = treeGeneratorService.getTree()
		render tree as JSON
	}
	
	def getInfo(long id) {
		def nodeInfo = nodeManagerService.getInfo(id)
		render nodeInfo as JSON
	}
	
	def deleteNode(long id) {
		nodeManagerService.deleteNode(id)
		render "success"
	}
	
	def saveNode() {
		params.remove('id')
		if(nodeManagerService.saveNode(params)) {
			render "success"
		}
	}
	
}
