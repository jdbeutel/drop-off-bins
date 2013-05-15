<%@ page import="dropoffbins.Report" %>



<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'bin', 'error')} required">
	<label for="bin">
		<g:message code="report.bin.label" default="Bin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bin" name="bin.id" from="${dropoffbins.Bin.list()}" optionKey="id" required="" value="${reportInstance?.bin?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="report.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${dropoffbins.Status?.values()}" keys="${dropoffbins.Status.values()*.name()}" required="" value="${reportInstance?.status?.name()}"/>
</div>

