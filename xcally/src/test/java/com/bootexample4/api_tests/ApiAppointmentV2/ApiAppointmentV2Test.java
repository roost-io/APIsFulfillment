
package com.bootexample4.api_tests.ApiAppointmentV2;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
// import com.intuit.karate.http.HttpServer;
// import com.intuit.karate.http.ServerConfig;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ApiAppointmentV2Test {

	@Test
	void testAll() {
		String APIHOST = System.getenv().get("API_HOST");
		Results results = Runner.path("src/test/java/com/bootexample4/api_tests/ApiAppointmentV2")
			.systemProperty("API_HOST", APIHOST)
			.reportDir("testReport")
			.parallel(1);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

}
