import 'package:flutter/cupertino.dart';
import 'package:roadmate_products/modules/product_details/service/product_details.service.dart';

import '../../../global/config/config.dart';

class ProductDetailsController with ChangeNotifier {
  bool apiLoading = false;

//?---------------------------------------------------------------- API calling

  callProductDetails(String productId) async {
    apiLoading = true;
    notifyListeners();
    final response = await ProductDetailsService()
        .getProductDetails({"productid": productId});

    if (response.statusCode == 200) {
    dataInterceptor.setProductDetailsModel(response);
      apiLoading = false;
      notifyListeners();
    } else {
      apiLoading = false;
      notifyListeners();
    }
  }
}
