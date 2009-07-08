package org.kiy0taka.boytwoman

import javax.script.*
import com.google.appengine.api.users.UserServiceFactory

class DashboardController {

    def jdoTemplate

    def loginUser

    def index = {
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
