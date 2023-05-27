import 'dart:convert';

import 'package:bank_gold/services/logging_interceptors_service.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class CotacaoService {
  static const String url = "https://api.hgbrasil.com/finance";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<Map<String, dynamic>> verCotacao() async {
    http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception();
    }

    Map<String, dynamic> resultado = json.decode(response.body);

    return resultado["results"]["currencies"];
  }
}
