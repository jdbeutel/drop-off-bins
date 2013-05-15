<%@ page import="dropoffbins.Bin" %>


<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="bin.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${binInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'reports', 'error')} ">
    <label for="reports">
        <g:message code="bin.reports.label" default="Reports" />

    </label>

    <ul class="one-to-many">
        <g:each in="${binInstance?.reports?}" var="r">
            <li><g:link controller="report" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="report" action="create" params="['bin.id': binInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'report.label', default: 'Report')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'streetAddress', 'error')} ">
    <label for="streetAddress">
        <g:message code="bin.streetAddress.label" default="Street Address" />

    </label>
    <g:textField name="streetAddress" value="${binInstance?.streetAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="bin.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${binInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'state', 'error')} ">
    <label for="state">
        <g:message code="bin.state.label" default="State" />

    </label>
    <g:textField name="state" value="${binInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'zip', 'error')} ">
    <label for="zip">
        <g:message code="bin.zip.label" default="Zip" />

    </label>
    <g:textField name="zip" value="${binInstance?.zip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'lat', 'error')} ">
	<label for="lat">
		<g:message code="bin.lat.label" default="Lat" />
		
	</label>
	<g:textField name="lat" value="${binInstance?.lat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'lng', 'error')} ">
	<label for="lng">
		<g:message code="bin.lng.label" default="Lng" />
		
	</label>
	<g:textField name="lng" value="${binInstance?.lng}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: binInstance, field: 'note', 'error')} ">
    <label for="note">
        <g:message code="bin.note.label" default="Note" />

    </label>
    <g:textField name="note" value="${binInstance?.note}"/>
</div>


