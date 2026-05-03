import 'dart:convert';

import 'package:edentist_mobile/models/recommendResult.dart';
import 'package:edentist_mobile/providers/base_provider.dart';

class RecommendResultProvider<T> extends BaseProvider<RecommendResult> {
  String? _mainBaseUrl;
  String _endpoint = "RecommendResult";

  RecommendResultProvider() : super("RecommendResult") {
    _mainBaseUrl = const String.fromEnvironment("mainBaseUrl",
        defaultValue: "http://10.0.2.2:5192/");
  }

  @override
  RecommendResult fromJson(data) {
    return RecommendResult.fromJson(data);
  }

  Future trainData() async {
    var url = "$_mainBaseUrl$_endpoint/TrainModel";

    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http!.post(uri, headers: headers);
    print(response);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Unknown error");
    }
  }

  Future deleteData() async {
    var url = "$_mainBaseUrl$_endpoint/ClearRecommendation";

    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http!.delete(uri, headers: headers);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception("Unknown error");
    }
  }
}
