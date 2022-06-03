import 'package:handova/core/helpers/http_helper.dart';
import 'package:handova/core/models/state.dart';
import 'package:handova/core/models/user.dart';
import 'package:handova/core/services/base/simplify_api_consuming.dart';

class AuthenticationService {
  HttpHelper httpClient = HttpHelper();

  Future<ServiceState> loginUser({
    required String phone,
    required String password,
  }) async {
    Uri url = Uri.https('handova.ddns.net', '/api/login');
    final data = {
      "username": phone,
      "device_identification": "w0pSP0GcwC55vRFZuLZkKmCEk1cH02SylzWFZNsX",
      "firebase_messaging_token":
          "ujxPOCCBPk80wgTtafHjyGCbpqmG7uXkYEmynsWjsDL2lJEX6JGX9hR6UaykiNzsHZVIn32vQn3FEx8pDrSLhwz53zoOlgd8lbRZfuKKxwiBw13RBNcSzwYa9C4BusUddPfIO0sUgnSktW59yyidl3MOO4J344Pq",
      "password": password,
    };
    return SimplifyApiConsuming.simplifyEndpointConsumingReturn(
      () => httpClient.postUri(
        url,
        body: data,
      ),
      successResponse: (data) {
        return SuccessState<User>(User.fromJson(data));
      },
    );
  }
}
