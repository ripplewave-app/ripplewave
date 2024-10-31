package app.ripplewave.ripplewave_backend;

import org.springframework.boot.SpringApplication;

public class TestRipplewaveBackendApplication {

	public static void main(String[] args) {
		SpringApplication.from(RipplewaveBackendApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
