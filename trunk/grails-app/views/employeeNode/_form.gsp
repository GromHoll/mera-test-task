<%@ page import="com.mera.sqms.EmployeeNode" %>



<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="employeeNode.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="32" required="" value="${employeeNodeInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="employeeNode.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="32" required="" value="${employeeNodeInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="employeeNode.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.mera.sqms.ProjectNode.list()}" optionKey="id" required="" value="${employeeNodeInstance?.project?.id}" class="many-to-one"/>
</div>

