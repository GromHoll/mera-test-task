
<%@ page import="com.mera.sqms.OrganizationNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizationNode.label', default: 'OrganizationNode')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-organizationNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-organizationNode" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list organizationNode">
			
				<g:if test="${organizationNodeInstance?.orgName}">
				<li class="fieldcontain">
					<span id="orgName-label" class="property-label"><g:message code="organizationNode.orgName.label" default="Org Name" /></span>
					
						<span class="property-value" aria-labelledby="orgName-label"><g:fieldValue bean="${organizationNodeInstance}" field="orgName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizationNodeInstance?.units}">
				<li class="fieldcontain">
					<span id="units-label" class="property-label"><g:message code="organizationNode.units.label" default="Units" /></span>
					
						<g:each in="${organizationNodeInstance.units}" var="u">
						<span class="property-value" aria-labelledby="units-label"><g:link controller="unitNode" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${organizationNodeInstance?.id}" />
					<g:link class="edit" action="edit" id="${organizationNodeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
