
<%@ page import="com.mera.sqms.EmployeeNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employeeNode.label', default: 'EmployeeNode')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employeeNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employeeNode" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employeeNode">
			
				<g:if test="${employeeNodeInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="employeeNode.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${employeeNodeInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="employeeNode.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${employeeNodeInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="employeeNode.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${employeeNodeInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="employeeNode.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${employeeNodeInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.home}">
				<li class="fieldcontain">
					<span id="home-label" class="property-label"><g:message code="employeeNode.home.label" default="Home" /></span>
					
						<span class="property-value" aria-labelledby="home-label"><g:fieldValue bean="${employeeNodeInstance}" field="home"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.apartment}">
				<li class="fieldcontain">
					<span id="apartment-label" class="property-label"><g:message code="employeeNode.apartment.label" default="Apartment" /></span>
					
						<span class="property-value" aria-labelledby="apartment-label"><g:fieldValue bean="${employeeNodeInstance}" field="apartment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="employeeNode.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${employeeNodeInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="employeeNode.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeNodeInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeNodeInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="employeeNode.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="projectNode" action="show" id="${employeeNodeInstance?.project?.id}">${employeeNodeInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${employeeNodeInstance?.id}" />
					<g:link class="edit" action="edit" id="${employeeNodeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
