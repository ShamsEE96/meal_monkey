import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/core/enums/request_type.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';

  static String getFullApiRoute(String apiRoute) {
    return BASE_API + apiRoute;
  }

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    required RequestType requestType,
    Map<String, String>? extraHeaders = const {},
  }) {
    return {
      if (needAuth!)
        "Authorization":
            "Bearer ${SharedPreferencesRepository.getTokenInfo()?.accessToken ?? ''}",
      if (requestType != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
