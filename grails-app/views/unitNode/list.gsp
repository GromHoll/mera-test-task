
<%@ page import="com.mera.sqms.UnitNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unitNode.label', default: 'UnitNode')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unitNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unitNode" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="unitName" title="${message(code: 'unitNode.unitName.label', default: 'Unit Name')}" />
					
						<g:sortableColumn property="direction" title="${message(code: 'unitNode.direction.label', default: 'Direction')}" />
					
						<th><g:message code="unitNode.organization.label" default="Organization" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unitNodeInstanceList}" status="i" var="unitNodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unitNodeInstance.id}">${fieldValue(bean: unitNodeInstance, field: "unitName")}</g:link></td>
					
						<td>${fieldValue(bean: unitNodeInstance, field: "direction")}</td>
					
						<td>${fieldValue(bean: unitNodeInstance, field: "organization")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unitNodeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
