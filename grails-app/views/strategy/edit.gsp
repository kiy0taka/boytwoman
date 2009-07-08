<%@ page import="org.kiy0taka.boytwoman.Strategy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Strategy</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/dashboard/')}">Dashboard</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Strategy</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Strategy</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${strategy}">
            <div class="errors">
                <g:renderErrors bean="${strategy}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${strategy?.key?.id}" />
                <input type="hidden" name="version" value="${strategy?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="key">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:strategy,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:strategy,field:'name')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="script">Script:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:strategy,field:'script','errors')}"><div>function() {</div>
									<textarea id="script" name="script">${fieldValue(bean:strategy,field:'script')}</textarea>
								<div>}</div>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
	                <span class="button"><g:actionSubmit value="Test" /></span>
                </div>
				<g:if test="${testResults}">
				<div class="list">
		            <h1>Test Results</h1>
					<table>
						<thead>
						<tr>
							<g:each in="${testResults}" status="i" var="result">
								<th>#${i+1}</th>
							</g:each>
						</tr>
						</thead>
						<tbody>
						<tr>
							<g:each in="${testResults}" status="i" var="result">
								<th>${result.errorMessage ?: result.hand}</th>
							</g:each>
						</tr>
						</tbody>
					</table>
				</div>
				</g:if>
            </g:form>
        </div>
    </body>
</html>
