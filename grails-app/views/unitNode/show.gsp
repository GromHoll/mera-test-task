
<%@ page import="com.mera.sqms.UnitNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unitNode.label', default: 'UnitNode')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-unitNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unitNode" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unitNode">
			
				<g:if test="${unitNodeInstance?.unitName}">
				<li class="fieldcontain">
					<span id="unitName-label" class="property-label"><g:message code="unitNode.unitName.label" default="Unit Name" /></span>
					
						<span class="property-value" aria-labelledby="unitName-label"><g:fieldValue bean="${unitNodeInstance}" field="unitName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unitNodeInstance?.organization}">
				<li class="fieldcontain">
					<span id="organization-label" class="property-label"><g:message code="unitNode.organization.label" default="Organization" /></span>
					
						<span class="property-value" aria-labelledby="organization-label"><g:link controller="organizationNode" action="show" id="${unitNodeInstance?.organization?.id}">${unitNodeInstance?.organization?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${unitNodeInstance?.projects}">
				<li class="fieldcontain">
					<span id="projects-label" class="property-label"><g:message code="unitNode.projects.label" default="Projects" /></span>
					
						<g:each in="${unitNodeInstance.projects}" var="p">
						<span class="property-value" aria-labelledby="projects-label"><g:link controller="projectNode" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${unitNodeInstance?.id}" />
					<g:link class="edit" action="edit" id="${unitNodeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
