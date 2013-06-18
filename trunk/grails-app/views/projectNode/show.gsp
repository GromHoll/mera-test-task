
<%@ page import="com.mera.sqms.ProjectNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectNode.label', default: 'ProjectNode')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectNode" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectNode">
			
				<g:if test="${projectNodeInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectNode.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${projectNodeInstance}" field="projectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectNodeInstance?.site}">
				<li class="fieldcontain">
					<span id="site-label" class="property-label"><g:message code="projectNode.site.label" default="Site" /></span>
					
						<span class="property-value" aria-labelledby="site-label"><g:fieldValue bean="${projectNodeInstance}" field="site"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectNodeInstance?.technologies}">
				<li class="fieldcontain">
					<span id="technologies-label" class="property-label"><g:message code="projectNode.technologies.label" default="Technologies" /></span>
					
						<span class="property-value" aria-labelledby="technologies-label"><g:fieldValue bean="${projectNodeInstance}" field="technologies"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectNodeInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="projectNode.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:fieldValue bean="${projectNodeInstance}" field="customer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectNodeInstance?.employees}">
				<li class="fieldcontain">
					<span id="employees-label" class="property-label"><g:message code="projectNode.employees.label" default="Employees" /></span>
					
						<g:each in="${projectNodeInstance.employees}" var="e">
						<span class="property-value" aria-labelledby="employees-label"><g:link controller="employeeNode" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectNodeInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="projectNode.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:link controller="unitNode" action="show" id="${projectNodeInstance?.unit?.id}">${projectNodeInstance?.unit?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectNodeInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectNodeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
