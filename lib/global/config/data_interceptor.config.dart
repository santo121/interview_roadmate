import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:roadmate_products/modules/bottom_nav/model/get_brand.model.dart';
import '../../modules/bottom_nav/model/brand_filter.model.dart';
import '../../modules/bottom_nav/model/category.model.dart';
import '../../modules/bottom_nav/model/product_list.model.dart';
import '../../modules/bottom_nav/model/sub_categoru_list.model.dart';
import '../../modules/product_details/models/product_details.model.dart';

// class

class DataInterceptor with ChangeNotifier {
  CategoryModel categoryModel = CategoryModel();
  ProductListModel productListModel = ProductListModel();
  BrandListModel brandListModel = BrandListModel();
  SubCategoryListModel subCategoryListModel = SubCategoryListModel();
  BrandFilterModel brandFilterModel = BrandFilterModel();
  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  List<Subcategorylist> subCategory = [];
  List<BrandList> brandList = [];

  setProductDetailsModel(Response data) {
    productDetailsModel = ProductDetailsModel.fromJson(json.decode(data.body));
    notifyListeners();
  }

  setBrandFilterModel(Response data) {
    brandFilterModel = BrandFilterModel.fromJson(json.decode(data.body));

    productListModel.productList = [];
    notifyListeners();
    for (Product data in brandFilterModel.product ?? []) {
      productListModel.productList?.add(ProductList(
        b2cStatus: data.b2cStatus,
        brandId: data.brandId,
        createdAt: data.createdAt,
        description: data.description,
        hsncode: data.hsncode,
        id: data.id,
        images: data.images,
        noReturnDays: data.noReturnDays,
        offerPrice: data.offerPrice,
        prate: data.prate,
        price: data.price,
        priority: data.priority,
        productName: data.productName,
        sellingMrp: data.sellingMrp,
        sellingRate: data.sellingRate,
        status: data.status,
        updatedAt: data.updatedAt,
      ));
    }
    notifyListeners();
  }

  setCategoryModel(Response data) {
    categoryModel = CategoryModel.fromJson(json.decode(data.body));
    notifyListeners();
  }

  setProductListModel(Response data) {
    productListModel = ProductListModel.fromJson(json.decode(data.body));
    notifyListeners();
  }

//*------------------------------------------------------------------ brand list
  setBrandListModel(Response data) {
    brandList = [];
    notifyListeners();
    brandListModel = BrandListModel.fromJson(json.decode(data.body));
    notifyListeners();
    for (final i in brandListModel.brandList ?? []) {
      brandList.add(i);
    }
    notifyListeners();
  }

  upDateBrandListModel(int index, bool? data) {
    brandList[index] = BrandList(
      brandName: brandList[index].brandName,
      catId: brandList[index].catId,
      checkMark: data,
      createdAt: brandList[index].createdAt,
      id: brandList[index].id,
      status: brandList[index].status,
      updatedAt: brandList[index].updatedAt,
      vendorId: brandList[index].vendorId,
    );
    notifyListeners();
  }

//*------------------------------------------------------------------ brand list

//*------------------------------------------------------------------
  setSubCategoryList(Response data) {
    subCategory = [];
    notifyListeners();
    subCategoryListModel =
        SubCategoryListModel.fromJson(json.decode(data.body));
    for (final i in subCategoryListModel.subcategorylist ?? []) {
      subCategory.add(i);
    }
    notifyListeners();
  }

  setEmptySubCategoryList() {
    subCategory = [];
    notifyListeners();
  }
//*------------------------------------------------------------------
}
