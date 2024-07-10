
    package org.springframework.api_tests;
  
    import com.intuit.karate.Results;
    import com.intuit.karate.Runner;
    // import com.intuit.karate.http.HttpServer;
    // import com.intuit.karate.http.ServerConfig;
    import org.junit.jupiter.api.Test;
  
    import static org.junit.jupiter.api.Assertions.assertEquals;
  
    class ApiTest {
  
        @Test
        void testAll() {
            String troubleticket_v2_url = System.getenv().getOrDefault("TROUBLETICKET_V2_URL", "http://localhost:4010");
String geographicaddressmanagement_v1_url = System.getenv().getOrDefault("GEOGRAPHICADDRESSMANAGEMENT_V1_URL", "http://localhost:4010");
String geographicaddressmanagement_v1_auth_token = System.getenv().getOrDefault("GEOGRAPHICADDRESSMANAGEMENT_V1_AUTH_TOKEN", "dummy_GEOGRAPHICADDRESSMANAGEMENT_V1_AUTH_TOKEN");
            Results results = Runner.path("src/test/java/org/springframework/api_tests")
                    .systemProperty("TROUBLETICKET_V2_URL",troubleticket_v2_url)
.systemProperty("GEOGRAPHICADDRESSMANAGEMENT_V1_URL",geographicaddressmanagement_v1_url)
.systemProperty("GEOGRAPHICADDRESSMANAGEMENT_V1_AUTH_TOKEN", geographicaddressmanagement_v1_auth_token)
                    .reportDir("testReport").parallel(1);
            assertEquals(0, results.getFailCount(), results.getErrorMessages());
        }
  
    }
