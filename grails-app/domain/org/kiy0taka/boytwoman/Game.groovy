package org.kiy0taka.boytwoman

import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable="true")
class Game implements Serializable {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Key key

    @Persistent
    String title

    @Persistent
    String description

    @Persistent
    Long ownerId

	@Persistent(mappedBy = 'game')
	List<Entry> entries = []

    static constraints = {
    	key(nullable:true)
    	title(blank:false, maxSize:100)
    	description(maxSize:2000)
   	    entries()
	}
}
