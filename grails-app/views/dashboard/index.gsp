<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Dashboard</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'/dashboard/')}">Dashboard</a></span>
            <span class="menuButton"><g:link class="create" controller="strategy" action="create">New Strategy</g:link></span>
            <span class="menuButton"><g:link class="create" controller="game" action="create">New Game</g:link></span>
			<span class="menuButton"><a href="<g:logoutUrl />">Logout</a></span>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="list">
	            <h1>Strategy List</h1>
				<table>
					<tbody>
					<g:each in="${strategies}" status="i" var="strategy">
                    	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<td><g:link controller="strategy" action="edit" id="${strategy.key.id}">${fieldValue(bean:strategy, field:'name')}</g:link></td>
                    	</tr>
					</g:each>
					</tbody>
				</table>
            </div>
			
            <div class="list">
	            <h1>Game List</h1>
				<table>
					<tbody>
					<g:each in="${games}" status="i" var="game">
                    	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<td><g:link controller="game" action="edit" id="${game.key.id}">${fieldValue(bean:game, field:'title')}</g:link></td>
                    	</tr>
					</g:each>
					</tbody>
				</table>
            </div>

			<div class="list">
		        <h1>Entry List</h1>
				<table>
					<tbody>
					<g:each in="${entries}" status="i" var="entry">
	                   	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                       	<td><g:link controller="game" action="show" id="${entry.game.key.id}">${fieldValue(bean:entry, field:'game.title')}</g:link></td>
	                   	</tr>
					</g:each>
					</tbody>
				</table>
			</div>

        </div>
    </body>
</html>
