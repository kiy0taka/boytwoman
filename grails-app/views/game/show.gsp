<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Game</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/dashboard/')}">Dashboard</a></span>
        </div>
        <div class="body">
            <h1>Show Strategy</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            <td valign="top" class="value">${fieldValue(bean:game, field:'title')}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>                            
                            <td valign="top" class="value"><pre>${fieldValue(bean:game, field:'description')}</pre></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form action="entry" method="post">
					<g:select name="strategy.id" from="${strategies}" keys="${strategies.collect {it.key.id}}" optionValue="name" noSelection="['':'- Random -']"/>
                    <input type="hidden" name="id" value="${game?.key?.id}" />
                    <span class="button"><g:actionSubmit value="Entry" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
