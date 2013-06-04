<%@ page import="com.mera.sqms.ProjectNode" %>



<div class="fieldcontain ${hasErrors(bean: projectNodeInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectNode.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectName" maxlength="32" required="" value="${projectNodeInstance?.projectName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectNodeInstance, field: 'employees', 'error')} ">
	<label for="employees">
		<g:message code="projectNode.employees.label" default="Employees" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectNodeInstance?.employees?}" var="e">
    <li><g:link controller="employeeNode" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="employeeNode" action="create" params="['projectNode.id': projectNodeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'employeeNode.label', default: 'EmployeeNode')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectNodeInstance, field: 'unit', 'error')} required">
	<label for="unit">
		<g:message code="projectNode.unit.label" default="Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unit" name="unit.id" from="${com.mera.sqms.UnitNode.list()}" optionKey="id" required="" value="${projectNodeInstance?.unit?.id}" class="many-to-one"/>
</div>

