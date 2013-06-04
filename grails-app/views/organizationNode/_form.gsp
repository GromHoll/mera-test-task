<%@ page import="com.mera.sqms.OrganizationNode" %>



<div class="fieldcontain ${hasErrors(bean: organizationNodeInstance, field: 'orgName', 'error')} required">
	<label for="orgName">
		<g:message code="organizationNode.orgName.label" default="Org Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="orgName" maxlength="32" required="" value="${organizationNodeInstance?.orgName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organizationNodeInstance, field: 'units', 'error')} ">
	<label for="units">
		<g:message code="organizationNode.units.label" default="Units" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${organizationNodeInstance?.units?}" var="u">
    <li><g:link controller="unitNode" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="unitNode" action="create" params="['organizationNode.id': organizationNodeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unitNode.label', default: 'UnitNode')])}</g:link>
</li>
</ul>

</div>

