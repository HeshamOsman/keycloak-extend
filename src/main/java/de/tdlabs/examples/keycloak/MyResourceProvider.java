package de.tdlabs.examples.keycloak;
import org.jboss.resteasy.annotations.cache.NoCache;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.RealmProvider;
import org.keycloak.models.UserModel;
import org.keycloak.models.UserProvider;
import org.keycloak.models.cache.infinispan.UserAdapter;
import org.keycloak.models.jpa.JpaRealmProvider;
import org.keycloak.models.jpa.JpaRealmProviderFactory;
import org.keycloak.models.jpa.JpaUserProvider;
import org.keycloak.models.jpa.JpaUserProviderFactory;
import org.keycloak.models.jpa.RealmAdapter;

import org.keycloak.models.jpa.entities.RealmEntity;
import org.keycloak.models.jpa.entities.UserEntity;
import org.keycloak.services.resource.RealmResourceProvider;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import de.tdlabs.examples.keycloak.MyResourceProvider.User;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Produces;
public class MyResourceProvider implements RealmResourceProvider {

    private KeycloakSession session;

    public MyResourceProvider(KeycloakSession session) {
        this.session = session;
    }

    @Override
    public Object getResource() {
        return this;
    }

    @GET
//    @NoCache
    @Produces(javax.ws.rs.core.MediaType.APPLICATION_JSON)
    public User get() {
        String name = session.getContext().getRealm().getDisplayName();
        if (name == null) {
            name = session.getContext().getRealm().getName();
        }
        
        JpaRealmProviderFactory rf = new JpaRealmProviderFactory();
        RealmProvider rp = rf.create(session);
        
        RealmModel rm = rp.getRealm("master");
        
//        RealmEntity r = new RealmEntity();
//		r.setId();
//		RealmAdapter ra = new RealmAdapter(null, null, r);
		UserAdapter um = null;
		
			JpaUserProviderFactory uf = new JpaUserProviderFactory();
			UserProvider up = uf.create(session);
			return new User(session.users().getUserByUsername("hosman", rm));
//			J = session.getProvider(JpaUserProvider.class);
//			System.out.println(up==null?"NUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUULLLLLLLLL" :">>>>nooooooooooooooooooo");
//			 um =(UserAdapter) up.getUserByUsername("hosman", rm);
//			System.out.println(um==null?"NUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUULLLLLLLLL" :">>>>"+um.getEmail());
//		
//		
//		return um.getEntity();
        
        
//        return "Hello " + name;
    }

    @Override
    public void close() {
    }
    
    class User implements Serializable{
    	/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		String userName;
        String lastName;
        String firstName;
        String email;
        
    	public User(UserModel um) {
    		this.userName = um.getUsername();
    		this.lastName = um.getLastName();
    		this.firstName = um.getFirstName();
    		this.email = um.getEmail();
    	}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getLastName() {
			return lastName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
    	
    }

}
