package com.mera.sqms

import static org.junit.Assert.*
import org.junit.*

import com.mera.sqms.EmployeeNode;
import com.mera.sqms.Node;
import com.mera.sqms.OrganizationNode;
import com.mera.sqms.ProjectNode;
import com.mera.sqms.UnitNode;

class DbTreeTests {

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testDbTree() {
        def organization = new OrganizationNode(orgName: "Organization 1").save();
        def unit = new UnitNode(unitName: "Unit 1")
        def project = new ProjectNode(projectName: "Project 1")
        def employee1 = new EmployeeNode(firstName: "Finn", lastName: "The Human")
        def employee2 = new EmployeeNode(firstName: "Jake", lastName: "The Dog")
		
		project.addToEmployees(employee1)
		project.addToEmployees(employee2)		
		unit.addToProjects(project)		
		organization.addToUnits(unit)
		
		assertTrue organization.validate()
		assertTrue unit.validate()
		assertTrue project.validate()
		assertTrue employee1.validate()
		assertTrue employee2.validate()
		
		assertEquals 5, Node.count()
		
		assertEquals 1, organization.units.size()
		assertEquals 1, unit.projects.size()
		assertEquals 2, project.employees.size()		
    }
}
