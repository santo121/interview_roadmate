import 'dart:convert';

import 'package:http/http.dart';

import '../../../global/config/network_interceptor.config.dart';
import '../../../global/config/urls.config.dart';

class ProductDetailsService{
//?------ brand api call
  //?--- (done)
  Future<Response> getProductDetails(Object? body) async {
    return await httpRequests(
        url: ApiUrls().productDetailsApiUrl,
        body: jsonEncode(body),
        httpType: HttpMethods.post);
  }
}