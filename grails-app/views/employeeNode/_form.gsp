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

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="employeeNode.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${employeeNodeInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="employeeNode.street.label" default="Street" />
		
	</label>
	<g:textField name="street" value="${employeeNodeInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'home', 'error')} ">
	<label for="home">
		<g:message code="employeeNode.home.label" default="Home" />
		
	</label>
	<g:textField name="home" value="${employeeNodeInstance?.home}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'apartment', 'error')} ">
	<label for="apartment">
		<g:message code="employeeNode.apartment.label" default="Apartment" />
		
	</label>
	<g:textField name="apartment" value="${employeeNodeInstance?.apartment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="employeeNode.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${employeeNodeInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="employeeNode.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${employeeNodeInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeNodeInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="employeeNode.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.mera.sqms.ProjectNode.list()}" optionKey="id" required="" value="${employeeNodeInstance?.project?.id}" class="many-to-one"/>
</div>

