<%@ page import="org.kiy0taka.boytwoman.Strategy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Game</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/dashboard/')}">Dashboard</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Game</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Game</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${game}">
            <div class="errors">
                <g:renderErrors bean="${game}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${game?.key?.id}" />
                <input type="hidden" name="version" value="${game?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="key">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:game,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:game,field:'title')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="script">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:game,field:'description','errors')}">
									<g:textArea name="description" value="${game.description}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:actionSubmit onclick="return confirm('Are you sure?');" value="Start" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
