//package de.tdlabs.examples.keycloak;
//
//import javax.validation.Valid;
//
//import org.keycloak.models.KeycloakSession;
//import org.keycloak.models.UserModel;
//import org.keycloak.models.jpa.JpaUserProvider;
//import org.keycloak.models.jpa.RealmAdapter;
//import org.keycloak.models.jpa.entities.RealmEntity;
//import org.keycloak.models.jpa.entities.UserEntity;
//import org.keycloak.services.resource.RealmResourceProvider;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/api")
//public class KeycloakUser implements RealmResourceProvider {
//
//	 private KeycloakSession session;
//
//	    public KeycloakUser(KeycloakSession session) {
//	        this.session = session;
//	    }
//	
//	
//	@GetMapping("/wrapper/users")
//	public ResponseEntity<UserModel> getAnyUser() {
//		UserEntity user = new UserEntity();
//		user.setEmail("hesham.osman28@yahoo.com", false);
//		user.setFirstName("Name");
//		RealmEntity r = new RealmEntity();
//		r.setId("master");
//		RealmAdapter ra = new RealmAdapter(null, null, r);
//		return ResponseEntity.ok(session.getProvider(JpaUserProvider.class).getUserByUsername("hosman", ra));
//
//	}
//
//	@Override
//	public Object getResource() {
//		return this;
//	}
//
//	@Override
//	public void close() {
//	}
//}
