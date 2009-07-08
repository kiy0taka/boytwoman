//import org.kiy0taka.boytwoman.*

beans = {
    loginUser(userService:"getLoginUser") {
        it.singleton = false
        it.scope = 'request'
    }
}