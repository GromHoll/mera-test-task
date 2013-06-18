
<%@ page import="com.mera.sqms.ProjectNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectNode.label', default: 'ProjectNode')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectNode" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="projectName" title="${message(code: 'projectNode.projectName.label', default: 'Project Name')}" />
					
						<g:sortableColumn property="site" title="${message(code: 'projectNode.site.label', default: 'Site')}" />
					
						<g:sortableColumn property="technologies" title="${message(code: 'projectNode.technologies.label', default: 'Technologies')}" />
					
						<g:sortableColumn property="customer" title="${message(code: 'projectNode.customer.label', default: 'Customer')}" />
					
						<th><g:message code="projectNode.unit.label" default="Unit" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectNodeInstanceList}" status="i" var="projectNodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectNodeInstance.id}">${fieldValue(bean: projectNodeInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectNodeInstance, field: "site")}</td>
					
						<td>${fieldValue(bean: projectNodeInstance, field: "technologies")}</td>
					
						<td>${fieldValue(bean: projectNodeInstance, field: "customer")}</td>
					
						<td>${fieldValue(bean: projectNodeInstance, field: "unit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectNodeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
