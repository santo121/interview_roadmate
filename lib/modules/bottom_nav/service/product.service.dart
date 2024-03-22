import 'dart:convert';

import 'package:http/http.dart';
import 'package:roadmate_products/global/config/network_interceptor.config.dart';
import 'package:roadmate_products/global/config/urls.config.dart';

class ProductService {
  //*---------------------------------------------------------------- ( get Category api )
  //?--- (done)
  Future<Response> getCategory() async {
    return await httpRequests(
        url: ApiUrls().getCategoryApiUrl, httpType: HttpMethods.get);
  }

  //*---------------------------------------------------------------- ( get SubCategory api )
  //?--- (done)
  Future<Response> getSubCategoryList(Object? body) async {
    return await httpRequests(
        url: ApiUrls().subcategoryListApiUrl,
        body: jsonEncode(body),
        httpType: HttpMethods.post);
  }

  //*---------------------------------------------------------------- ( Search api )
  //todo:--- (pending)
  Future<Response> searchProducts(Object? body) async {
    return await httpRequests(
      body: jsonEncode(body),
      url: ApiUrls().searchProductApiUrl,
      httpType: HttpMethods.post,
    );
  }

  //*---------------------------------------------------------------- ( Brand list api )
  //?--- (done)
  Future<Response> getBrands(Object? body) async {
    return await httpRequests(
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
        url: ApiUrls().brandListApiUrl,
        httpType: HttpMethods.post);
  }

  //*---------------------------------------------------------------- ( Brand Filter api )
  //?--- (done)
  Future<Response> applyBrandFilter(Object? body) async {
    return await httpRequests(
        body: jsonEncode(body),
        url: ApiUrls().brandFilterApiUrl,
        httpType: HttpMethods.post);
  }

  //*---------------------------------------------------------------- ( Product list )
  //?--- (done)
  Future<Response> getProductList(Object? body) async {
    return await httpRequests(
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
        url: ApiUrls().categoryProductListApiUrl,
        httpType: HttpMethods.post);
  }
}
