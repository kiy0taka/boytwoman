package org.kiy0taka.boytwoman

import javax.jdo.*
import com.google.appengine.api.datastore.*

class StrategyController {

	def persistenceManager

    def loginUser

    def strategyService
    
    def index = { redirect(controller:'dashboard') }

    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def delete = {
        try {
    	    def strategy = persistenceManager.getObjectById(Strategy.class, createKey())
            def name = strategy.name
            persistenceManager.deletePersistent(strategy)
            flash.message = "Strategy $name deleted"
            redirect(controller:'dashboard')
        }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Strategy not found"
            redirect(controller:'dashboard')
        }
    }

    def edit = {
        try {
	        def strategy = persistenceManager.getObjectById(Strategy, createKey())
            [strategy:persistenceManager.detachCopy(strategy)]
        }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Strategy not found"
            redirect(controller:'dashboard')
        }
    }

    def update = {
    	try {
    	 	def strategy = persistenceManager.getObjectById(Strategy, createKey())
            strategy.properties = params
            if (strategy.validate()) {
				persistenceManager.makePersistent(strategy)
				flash.message = "Strategy ${params.name} updated"
	            redirect(controller:'dashboard')
 			}
            else {
                render(view:'edit',model:[strategy:strategy])
            }
        }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Strategy not found"
            redirect(controller:'dashboard')
        }
    }

    def create = {['strategy':new Strategy(params)]}

    def save = {
        def strategy = new Strategy(params)
        strategy.owner = loginUser
		if (strategy.validate()) {
		    loginUser.strategies << strategy
			persistenceManager.makePersistent(strategy)
			flash.message = "Strategy ${strategy.name} created"
            redirect(controller:'dashboard')
		}
		else {
		    render(view:'create',model:[strategy:strategy])
		}
    }

    def test = {
        def strategy = new Strategy(params)
        strategy.key = createKey()
		render(view:'edit', model:[strategy:strategy, testResults:strategyService.test(strategy)])
    }

    private createKey() {
        KeyFactory.createKey(loginUser.key, Strategy.simpleName, params.id.toLong())
    }
}
