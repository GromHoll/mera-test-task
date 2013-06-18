<%@ page import="com.mera.sqms.UnitNode" %>



<div class="fieldcontain ${hasErrors(bean: unitNodeInstance, field: 'unitName', 'error')} required">
	<label for="unitName">
		<g:message code="unitNode.unitName.label" default="Unit Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unitName" maxlength="32" required="" value="${unitNodeInstance?.unitName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitNodeInstance, field: 'direction', 'error')} ">
	<label for="direction">
		<g:message code="unitNode.direction.label" default="Direction" />
		
	</label>
	<g:textField name="direction" value="${unitNodeInstance?.direction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitNodeInstance, field: 'organization', 'error')} required">
	<label for="organization">
		<g:message code="unitNode.organization.label" default="Organization" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organization" name="organization.id" from="${com.mera.sqms.OrganizationNode.list()}" optionKey="id" required="" value="${unitNodeInstance?.organization?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitNodeInstance, field: 'projects', 'error')} ">
	<label for="projects">
		<g:message code="unitNode.projects.label" default="Projects" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${unitNodeInstance?.projects?}" var="p">
    <li><g:link controller="projectNode" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectNode" action="create" params="['unitNode.id': unitNodeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectNode.label', default: 'ProjectNode')])}</g:link>
</li>
</ul>

</div>

