package org.kiy0taka.boytwoman

import javax.jdo.*
import com.google.appengine.api.datastore.*

class GameController {

    def persistenceManager

    def loginUser

    def index = { redirect(controller:'dashboard') }

    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def delete = {
        try {
    	    def game = persistenceManager.getObjectById(Game, createKey())
            def title = game.title
            persistenceManager.deletePersistent(game)
            flash.message = "Game $title deleted"
            redirect(controller:'dashboard')
        }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Game not found"
            redirect(controller:'dashboard')
        }
    }

    def edit = {
        try {
	        def game = persistenceManager.getObjectById(Game, createKey())
    	    [game:persistenceManager.detachCopy(game)]
	    }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Game not found"
            redirect(controller:'dashboard')
        }
    }

    def update = {
    	try {
    	 	def game = persistenceManager.getObjectById(Game, createKey())
            game.properties = params
            if (game.validate()) {
				persistenceManager.makePersistent(game)
				flash.message = "Game ${params.title} updated"
	            redirect(controller:'dashboard')
 			}
            else {
                render(view:'edit',model:[game:game])
            }
        }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Game not found"
            redirect(controller:'dashboard')
        }
    }

    def create = {['game':new Game(params)]}

    def save = {
        def game = new Game(params)
        game.ownerId = loginUser.key.id
		if (game.validate()) {
			persistenceManager.makePersistent(game)
			flash.message = "game ${game.title} created"
            redirect(controller:'dashboard')
		}
		else {
		    render(view:'create',model:[game:game])
		}
    }

    def start = {
        try {
	 	    def game = persistenceManager.getObjectById(Game, createKey())
            render(view:'show',
                model:[game:persistenceManager.detachCopy(game),strategies:loginUser.strategies])
        }
        catch (JDOObjectNotFoundException e) {
            flash.message = "Game not found"
            redirect(controller:'dashboard')
        }
    }

    def entry = {
        def game = persistenceManager.getObjectById(Game, createKey())
        def entry = new Entry(
            game:game,
            userId:loginUser.key.id,
            strategyId:params.'strategy.id'.toLong()
        )
        game.entries << entry
        persistenceManager.makePersistent(entry)
		flash.message = "game ${game.title} entried"
        redirect(controller:'dashboard')
    }

    private createKey() {
        params.id.toLong()
    }
}
