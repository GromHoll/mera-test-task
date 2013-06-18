
<%@ page import="com.mera.sqms.EmployeeNode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employeeNode.label', default: 'EmployeeNode')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employeeNode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employeeNode" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'employeeNode.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'employeeNode.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'employeeNode.city.label', default: 'City')}" />
					
						<g:sortableColumn property="street" title="${message(code: 'employeeNode.street.label', default: 'Street')}" />
					
						<g:sortableColumn property="home" title="${message(code: 'employeeNode.home.label', default: 'Home')}" />
					
						<g:sortableColumn property="apartment" title="${message(code: 'employeeNode.apartment.label', default: 'Apartment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeNodeInstanceList}" status="i" var="employeeNodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeNodeInstance.id}">${fieldValue(bean: employeeNodeInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: employeeNodeInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: employeeNodeInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: employeeNodeInstance, field: "street")}</td>
					
						<td>${fieldValue(bean: employeeNodeInstance, field: "home")}</td>
					
						<td>${fieldValue(bean: employeeNodeInstance, field: "apartment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeNodeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
