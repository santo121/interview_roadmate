import 'package:roadmate_products/global/config/config.dart';

class ApiUrls {
  final String getCategoryApiUrl = '${Config().baseUrl}/categorylist';
  final String subcategoryListApiUrl = '${Config().baseUrl}/subcategorylist';
  final String searchProductApiUrl = '${Config().baseUrl}/searchproduct';
  final String brandListApiUrl = '${Config().baseUrl}/brand_list';
  final String brandFilterApiUrl = '${Config().baseUrl}/brandfilter';
  final String categoryProductListApiUrl =
      '${Config().baseUrl}/categoryproductlist';
  final String productDetailsApiUrl = '${Config().baseUrl}/productdetails';
}
