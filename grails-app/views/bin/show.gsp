
<%@ page import="dropoffbins.Bin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bin.label', default: 'Bin')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bin" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bin">
			
				<g:if test="${binInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bin.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${binInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${binInstance?.reports}">
				<li class="fieldcontain">
					<span id="reports-label" class="property-label"><g:message code="bin.reports.label" default="Reports" /></span>
					
						<g:each in="${binInstance.reports}" var="r">
						<span class="property-value" aria-labelledby="reports-label"><g:link controller="report" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${binInstance?.streetAddress}">
				<li class="fieldcontain">
					<span id="streetAddress-label" class="property-label"><g:message code="bin.streetAddress.label" default="Street Address" /></span>
					
						<span class="property-value" aria-labelledby="streetAddress-label"><g:fieldValue bean="${binInstance}" field="streetAddress"/></span>
					
				</li>
				</g:if>

                <g:if test="${binInstance?.city}">
                    <li class="fieldcontain">
                        <span id="city-label" class="property-label"><g:message code="bin.city.label" default="City" /></span>

                        <span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${binInstance}" field="city"/></span>

                    </li>
                </g:if>

                <g:if test="${binInstance?.state}">
                    <li class="fieldcontain">
                        <span id="state-label" class="property-label"><g:message code="bin.state.label" default="State" /></span>

                        <span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${binInstance}" field="state"/></span>

                    </li>
                </g:if>

                <g:if test="${binInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="bin.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${binInstance}" field="zip"/></span>
					
				</li>
				</g:if>

                <g:if test="${binInstance?.lat}">
                    <li class="fieldcontain">
                        <span id="lat-label" class="property-label"><g:message code="bin.lat.label" default="Lat" /></span>

                        <span class="property-value" aria-labelledby="lat-label"><g:fieldValue bean="${binInstance}" field="lat"/></span>

                    </li>
                </g:if>

                <g:if test="${binInstance?.lng}">
                    <li class="fieldcontain">
                        <span id="lng-label" class="property-label"><g:message code="bin.lng.label" default="Lng" /></span>

                        <span class="property-value" aria-labelledby="lng-label"><g:fieldValue bean="${binInstance}" field="lng"/></span>

                    </li>
                </g:if>


                <g:if test="${binInstance?.note}">
                    <li class="fieldcontain">
                        <span id="note-label" class="property-label"><g:message code="bin.note.label" default="Note" /></span>

                        <span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${binInstance}" field="note"/></span>

                    </li>
                </g:if>


            </ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${binInstance?.id}" />
					<g:link class="edit" action="edit" id="${binInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
