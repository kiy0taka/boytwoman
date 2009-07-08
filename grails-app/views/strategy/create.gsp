<%@ page import="org.kiy0taka.boytwoman.Strategy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Strategy</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/dashboard/')}">Dashboard</a></span>
        </div>
        <div class="body">
            <h1>Create Strategy</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${strategy}">
            <div class="errors">
                <g:renderErrors bean="${strategy}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="script">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:strategy,field:'name','errors')}">
									<g:textField name="name" value="${strategy.name}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="script">Script:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:strategy,field:'script','errors')}">
									<div>function() {</div>
									<g:textArea name="script" value="${strategy.script}"/>
									<div>}</div>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
