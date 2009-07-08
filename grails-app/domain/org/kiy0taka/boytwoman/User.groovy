package org.kiy0taka.boytwoman



import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class User implements Serializable {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

	@Persistent
	String email

    @Persistent(mappedBy = 'owner')
    List<Strategy> strategies = []

    static constraints = {
    	key()
    	email(blank:false, email:true)
	}
}
