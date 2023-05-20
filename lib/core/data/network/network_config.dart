import 'package:meal_monkey/core/enums/request_type.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';

  static String getFullApiRoute(String apiRoute) {
    return BASE_API + apiRoute;
  }

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    RequestType? requestType = RequestType.POST,
    Map<String, String>? extraHeaders = const {},
  }) {
    return {
      if (needAuth!)
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiQ3VzdG9tZXIiLCJuYW1lIjoiMiIsIm5iZiI6MTY4NDMzNzU4NSwiZXhwIjoxNjg0ODU1OTg1LCJpYXQiOjE2ODQzMzc1ODV9.sOlCFIG0KpUmGQUOxOnc-LnFJcsHbxKDtiTB1mKvfTg",
      if (requestType == RequestType.POST) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
