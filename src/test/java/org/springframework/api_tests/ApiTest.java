
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
            String troubleticket_v2_4957c987ef_url = System.getenv().getOrDefault("TROUBLETICKET_V2_4957C987EF_URL", "http://localhost:4010");
String geographicaddressmanagement_v1_e8356b219b_url = System.getenv().getOrDefault("GEOGRAPHICADDRESSMANAGEMENT_V1_E8356B219B_URL", "http://localhost:4010");
            Results results = Runner.path("src/test/java/org/springframework/api_tests")
                    .systemProperty("TROUBLETICKET_V2_4957C987EF_URL",troubleticket_v2_4957c987ef_url)
.systemProperty("GEOGRAPHICADDRESSMANAGEMENT_V1_E8356B219B_URL",geographicaddressmanagement_v1_e8356b219b_url)
                    .reportDir("testReport").parallel(1);
            assertEquals(0, results.getFailCount(), results.getErrorMessages());
        }
  
    }
