<%@ page import="org.kiy0taka.boytwoman.Strategy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Strategy List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Strategy</g:link></span>
        </div>
        <div class="body">
            <h1>Strategy List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="key" title="Key" />
                        
                   	        <g:sortableColumn property="script" title="Script" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${strategyInstanceList}" status="i" var="strategyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${strategyInstance.id}">${fieldValue(bean:strategyInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:strategyInstance, field:'key')}</td>
                        
                            <td>${fieldValue(bean:strategyInstance, field:'script')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${strategyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
