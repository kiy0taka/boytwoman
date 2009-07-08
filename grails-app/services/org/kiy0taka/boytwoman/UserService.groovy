package org.kiy0taka.boytwoman

import com.google.appengine.api.users.UserServiceFactory

class UserService {

    def jdoTemplate

    boolean transactional = true

    def getLoginUser() {
        return jdoTemplate.find(User, "email == emailParam", "String emailParam",
            [emailParam:UserServiceFactory.userService?.currentUser?.email])[0]
    }
}
