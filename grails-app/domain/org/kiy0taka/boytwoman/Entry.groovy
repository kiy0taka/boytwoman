package org.kiy0taka.boytwoman



import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Entry implements Serializable {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

    @Persistent
    Game game

    @Persistent
    Long userId

    @Persistent
    Long strategyId

    static constraints = {
    	key(visible:false)
	}
}
