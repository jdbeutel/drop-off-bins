<div id="binStatus">
${bin.name}<br/>
    <div id="binError"></div>
    <g:lastReport bin="${bin}"/><br/>
<g:form action='report' method="post">
    <input type="hidden" name="id" value="${bin.id}"/>
    <g:each var="status" in="${dropoffbins.Status.values().sort().reverse()}">
        <g:radio name="status" value="${status}" checked="${bin.lastReport()?.status == status}"/> ${status.name()} <br/>
    </g:each>
    <input type="submit" value="Report"/>
</g:form>
${bin.streetAddress}<br/>
${bin.city}, ${bin.state}  ${bin.zip}<br/>
<a href="#" id="zoom">zoom</a>
</div>
