package org.kiy0taka.boytwoman

import javax.script.*
import com.google.appengine.api.users.UserServiceFactory

class DashboardController {

    def jdoTemplate

    def loginUser

    def index = {
        println new ScriptEngineManager().getEngineByName('js')
        if (!loginUser) {
            loginUser = new User(email:UserServiceFactory.userService.currentUser.email)
            jdoTemplate.makePersistent(loginUser)
        }
        [
            strategies:loginUser.strategies,
            games:jdoTemplate.find(Game),
            entries:jdoTemplate.find(Entry)
        ]
    }
}
