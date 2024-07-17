
    package com.bootexample4.api_tests;
  
    import com.intuit.karate.Results;
    import com.intuit.karate.Runner;
    // import com.intuit.karate.http.HttpServer;
    // import com.intuit.karate.http.ServerConfig;
    import org.junit.jupiter.api.Test;
  
    import static org.junit.jupiter.api.Assertions.assertEquals;
  
    class ApiTest {
  
        @Test
        void testAll() {
            String appointment_v2_80d7dadbb1_url = System.getenv().getOrDefault("APPOINTMENT_V2_80D7DADBB1_URL", "http://127.0.0.1:4010");
String geographicaddressmanagement_v1_e8356b219b_url = System.getenv().getOrDefault("GEOGRAPHICADDRESSMANAGEMENT_V1_E8356B219B_URL", "http://127.0.0.1:4011");
String productordering_v2_e3abac83bd_url = System.getenv().getOrDefault("PRODUCTORDERING_V2_E3ABAC83BD_URL", "http://127.0.0.1:4012");
String workordermanagement_v1_1c110e44a3_url = System.getenv().getOrDefault("WORKORDERMANAGEMENT_V1_1C110E44A3_URL", "http://127.0.0.1:4013");
String communicationmanagement_v2_b30fa28f22_url = System.getenv().getOrDefault("COMMUNICATIONMANAGEMENT_V2_B30FA28F22_URL", "http://127.0.0.1:4014");
String url_base = System.getenv().getOrDefault("url.base", "dummy_url.base");
            Results results = Runner.path("src/test/java/com/bootexample4/api_tests")
                    .systemProperty("APPOINTMENT_V2_80D7DADBB1_URL",appointment_v2_80d7dadbb1_url)
.systemProperty("GEOGRAPHICADDRESSMANAGEMENT_V1_E8356B219B_URL",geographicaddressmanagement_v1_e8356b219b_url)
.systemProperty("PRODUCTORDERING_V2_E3ABAC83BD_URL",productordering_v2_e3abac83bd_url)
.systemProperty("WORKORDERMANAGEMENT_V1_1C110E44A3_URL",workordermanagement_v1_1c110e44a3_url)
.systemProperty("COMMUNICATIONMANAGEMENT_V2_B30FA28F22_URL",communicationmanagement_v2_b30fa28f22_url)
.systemProperty("url.base", url_base)
                    .reportDir("testReport").parallel(1);
            assertEquals(0, results.getFailCount(), results.getErrorMessages());
        }
  
    }
