
<%@ page import="com.mera.sqms.OrganizationNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizationNode.label', default: 'OrganizationNode')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-organizationNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-organizationNode" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="orgName" title="${message(code: 'organizationNode.orgName.label', default: 'Org Name')}" />
					
						<g:sortableColumn property="yearOfCreating" title="${message(code: 'organizationNode.yearOfCreating.label', default: 'Year Of Creating')}" />
					
						<g:sortableColumn property="industry" title="${message(code: 'organizationNode.industry.label', default: 'Industry')}" />
					
						<g:sortableColumn property="site" title="${message(code: 'organizationNode.site.label', default: 'Site')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${organizationNodeInstanceList}" status="i" var="organizationNodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${organizationNodeInstance.id}">${fieldValue(bean: organizationNodeInstance, field: "orgName")}</g:link></td>
					
						<td>${fieldValue(bean: organizationNodeInstance, field: "yearOfCreating")}</td>
					
						<td>${fieldValue(bean: organizationNodeInstance, field: "industry")}</td>
					
						<td>${fieldValue(bean: organizationNodeInstance, field: "site")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${organizationNodeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
