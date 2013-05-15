
<%@ page import="dropoffbins.Bin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bin.label', default: 'Bin')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bin" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

                        <g:sortableColumn property="name" title="${message(code: 'bin.name.label', default: 'Name')}" />

                        <g:sortableColumn property="streetAddress" title="${message(code: 'bin.streetAddress.label', default: 'Street Address')}" />

                        <g:sortableColumn property="city" title="${message(code: 'bin.city.label', default: 'City')}" />

						<g:sortableColumn property="state" title="${message(code: 'bin.state.label', default: 'State')}" />

                        <g:sortableColumn property="zip" title="${message(code: 'bin.zip.label', default: 'Zip Code')}" />

                        <g:sortableColumn property="lat" title="${message(code: 'bin.lat.label', default: 'Lat')}" />

                        <g:sortableColumn property="lng" title="${message(code: 'bin.lng.label', default: 'Lng')}" />

                        <g:sortableColumn property="note" title="${message(code: 'bin.note.label', default: 'Note')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${binInstanceList}" status="i" var="binInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${binInstance.id}">${fieldValue(bean: binInstance, field: "name")}</g:link></td>

                        <td>${fieldValue(bean: binInstance, field: "streetAddress")}</td>

                        <td>${fieldValue(bean: binInstance, field: "city")}</td>

                        <td>${fieldValue(bean: binInstance, field: "state")}</td>

                        <td>${fieldValue(bean: binInstance, field: "zip")}</td>

						<td>${fieldValue(bean: binInstance, field: "lat")}</td>

                        <td>${fieldValue(bean: binInstance, field: "lng")}</td>

						<td>${fieldValue(bean: binInstance, field: "note")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${binInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
