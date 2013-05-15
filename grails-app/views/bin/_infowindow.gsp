<div id="binStatus">
${bin.name}<br/>
    <div id="binError"></div>
    <g:lastReport bin="${bin}"/><br/>
%{--<g:formRemote url="[controller: 'bin', action: 'report']" update="[success: 'binStatus', failure: 'binError']">--}%
    %{--<input type="hidden" name="id" value="${bin.id}"/>--}%
    %{--<g:radioGroup values="${Status.values()}" name="status"/>--}%
    %{--<input type="submit" value="Report"/>--}%
%{--</g:formRemote>--}%
${bin.streetAddress}<br/>
${bin.city}, ${bin.state}  ${bin.zip}<br/>
<a href="#" id="zoom">zoom</a>
</div>
