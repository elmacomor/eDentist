import 'dart:convert';

import 'package:eprodaja_admin/models/recommend_result.dart';
import 'package:eprodaja_admin/providers/base_provider.dart';
import 'package:http/http.dart' as http;

class RecommendResultProvider<T> extends BaseProvider<RecommendResult> {
  String? _mainBaseUrl;
  String _endpoint = "RecommendResult";

  RecommendResultProvider() : super("RecommendResult") {
    _mainBaseUrl = const String.fromEnvironment("mainBaseUrl",
        defaultValue: "http://localhost:5192/");
  }

  @override
  RecommendResult fromJson(data) {
    return RecommendResult.fromJson(data);
  }

  Future trainData() async {
    var url = "$_mainBaseUrl$_endpoint/TrainModel";

    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http.post(uri, headers: headers);
    print(response);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Unknown error");
    }
  }
}
