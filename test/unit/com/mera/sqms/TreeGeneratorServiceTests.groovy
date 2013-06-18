package com.mera.sqms

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*


class TreeGeneratorServiceTests extends grails.test.GrailsUnitTestCase {

    void testTreeGenerate() {
		
		mockLogging(TreeGeneratorService)
		def treeGeneratorService = new TreeGeneratorService()
		
		mockDomain(Node)
		mockDomain(OrganizationNode)
		mockDomain(UnitNode)
		mockDomain(ProjectNode)
		mockDomain(EmployeeNode)
		
		def organization = new OrganizationNode(orgName: "Organization")
		def unit = new UnitNode(unitName: "Unit")
		def project = new ProjectNode(projectName: "Project")
		def employee = new EmployeeNode(firstName: "Finn", lastName: "The Human")
		
		project.addToEmployees(employee)
		unit.addToProjects(project)
		organization.addToUnits(unit)
		organization.save()	
		
        assertEquals(treeGeneratorService.getTree().size(), 1)
    }
}
