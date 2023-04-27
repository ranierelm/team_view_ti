import 'package:team_view_ti/core/http/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImp implements IHttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await client.get(Uri.parse(url), headers: headers);

    return HttpResponse(response.body, response.statusCode);
  }
}
