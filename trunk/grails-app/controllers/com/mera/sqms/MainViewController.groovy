package com.mera.sqms

import grails.converters.JSON

class MainViewController {

	def treeGeneratorService
	
    def index() {
		def tree = treeGeneratorService.getTree()
		render tree as JSON
	}
	
}
