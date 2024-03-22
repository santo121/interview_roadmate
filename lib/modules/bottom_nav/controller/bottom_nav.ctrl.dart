import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/modules/bottom_nav/service/product.service.dart';

import '../model/product_list.model.dart';
import '../model/sub_categoru_list.model.dart';

class BottomNavController with ChangeNotifier {
  int selectedPos = 2;
  bool apiLoading = false;
  bool apiLoadingProduct = false;
  int selectedCategory = 0;
  String categoryName = 'All products';
  Subcategorylist? subCategory;
  bool isFilterGrid = false;

  setFilterGrid(bool grid) {
    isFilterGrid = grid;
    notifyListeners();
  }

  setSubCategory(Subcategorylist? category) {
    subCategory = category;
    notifyListeners();
  }

  changeSelectedCategory(int index, String productName) {
    selectedCategory = index;
    if (index == 0) {
      categoryName = 'All products';
    } else {
      categoryName = productName;
    }
    notifyListeners();
  }

  //*------------------------------------- API integration
//?--- category api call
  callCategoryDetails() async {
    apiLoading = true;
    notifyListeners();
    final response = await ProductService().getCategory();
    if (response.statusCode == 200) {
      dataInterceptor.setCategoryModel(response);
      apiLoading = false;
      notifyListeners();
    } else {
      apiLoading = false;
      notifyListeners();
    }
  }

//?--- Product api call
  String categoryIds = "0";
  Future<List<ProductList?>> callProductList(
    
      String categoryId, String index, bool isAllProducts) async {
    categoryIds = categoryId;

    if (isAllProducts) {
      apiLoadingProduct = true;

      final response = await ProductService()
          .getProductList({"categoryid": categoryId, "index": index});
      if (response.statusCode == 200) {
        setFilterGrid(false);
        // callSubCategoryList(categoryId);
        apiLoadingProduct = false;

        dataInterceptor.setProductListModel(response);

        return dataInterceptor.productListModel.productList ?? [];
      } else {
        apiLoadingProduct = false;

        return [];
      }
    } else {
      final ctrl = Provider.of<DataInterceptor>(globalContext, listen: false);
      ctrl.setEmptySubCategoryList();
      subCategory = null;
      notifyListeners();
      callSubCategoryList(categoryId, false);
      return [];
    }
  }

//?-----  subCategory list api
  callSubCategoryList(String catId, bool isAllProducts) async {
    setFilterGrid(false);
    final ctrl = Provider.of<DataInterceptor>(globalContext, listen: false);
    apiLoadingProduct = true;
    notifyListeners();
    final response =
        await ProductService().getSubCategoryList({"cat_id": catId});
    if (response.statusCode == 200) {
      apiLoadingProduct = false;
      notifyListeners();
      dataInterceptor.setSubCategoryList(response);
      if (!isAllProducts) {
        callProductList(
            (ctrl.subCategoryListModel.subcategorylist?.first.id ?? 0)
                .toString(),
            '0',
            true);
      }
      notifyListeners();
    } else {
      apiLoadingProduct = false;
      notifyListeners();
    }
  }

  bool brandLoading = false;

//?------ brand api call
  callBrandApiList(
    String subCatId,
  ) async {
    brandLoading = true;
    notifyListeners();
    final response = await ProductService().getBrands({"subcat_id": subCatId});
    if (response.statusCode == 200) {
      brandLoading = false;
      notifyListeners();
      dataInterceptor.setBrandListModel(response);
      notifyListeners();
    } else {
      brandLoading = false;
      notifyListeners();
    }
  }
//?----- filter brand

  callFilterBrand() async {
    setFilterGrid(true);
    final dataCtrl = Provider.of<DataInterceptor>(globalContext, listen: false);
    List<String> selectedBrand = [];
    for (final data in dataCtrl.brandList) {
      if (data.checkMark == true) {
        selectedBrand.add((data.id ?? 0).toString());
      }
    }

    brandLoading = true;
    apiLoadingProduct = true;
    notifyListeners();
    final response = await ProductService()
        .applyBrandFilter({"brand_id": selectedBrand.join(','), "index": "0"});
    if (response.statusCode == 200) {
      brandLoading = false;
      apiLoadingProduct = false;
      notifyListeners();
      dataInterceptor.setBrandFilterModel(response);
      notifyListeners();
    } else {
      brandLoading = false;
      apiLoadingProduct = false;
      notifyListeners();
    }
  }
//?----- search

  callSearchProduct(String val) async {
    setFilterGrid(true);
    final dataCtrl = Provider.of<DataInterceptor>(globalContext, listen: false);
    List<String> selectedBrand = [];
    for (final data in dataCtrl.brandList) {
      if (data.checkMark == true) {
        selectedBrand.add((data.id ?? 0).toString());
      }
    }

    brandLoading = true;
    apiLoadingProduct = true;
    notifyListeners();
    final response =
        await ProductService().searchProducts({"productname": val, "index": 0});
    if (response.statusCode == 200) {
      brandLoading = false;
      apiLoadingProduct = false;
      notifyListeners();
      dataInterceptor.setBrandFilterModel(response);
      notifyListeners();
    } else {
      brandLoading = false;
      apiLoadingProduct = false;
      notifyListeners();
    }
  }
}
