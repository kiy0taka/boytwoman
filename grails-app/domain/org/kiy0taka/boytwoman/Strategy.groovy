package org.kiy0taka.boytwoman



import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Strategy implements Serializable {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Key key

	@Persistent
    String name

	@Persistent
	String script

    @Persistent
    User owner

    static constraints = {
    	key(nullable:true)
    	name(blank:false, maxSize:100)
    	script(blank:false)
	}
}
