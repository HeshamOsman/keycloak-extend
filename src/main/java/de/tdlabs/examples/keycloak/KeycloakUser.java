//package de.tdlabs.examples.keycloak;
//
//import javax.validation.Valid;
//
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/api")
//public class KeycloakUser {
//
//	@PostMapping("/wrapper/users")
//	public ResponseEntity<?> createUser(@Valid @RequestBody UserDTO userDTO) {
//
//		final String uri = "http://localhost:8080/springrestexample/employees.xml";
//		RestTemplate restTemplate = new RestTemplate();
//		String result = restTemplate.getForObject(uri, String.class);
//	}
//}
//
//class U {
//   
//}
