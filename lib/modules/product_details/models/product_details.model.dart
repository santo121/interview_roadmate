import 'package:roadmate_products/global/config/functions.config.dart';

class ProductDetailsModel {
  bool? error;
  List<Productdetails>? productdetails;
  String? message;

  ProductDetailsModel({this.error, this.productdetails, this.message});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['productdetails'] != null) {
      productdetails = <Productdetails>[];
      json['productdetails'].forEach((v) {
        productdetails!.add( Productdetails.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class Productdetails {
  int? id;
  int? brandId;
  String? productName;
  String? offerPrice;
  String? price;
  String? sellingRate;
  int? sellingMrp;
  String? description;
  int? status;
  int? hsncode;
  int? priority;
  int? prate;
  int? noReturnDays;
  int? b2cStatus;
  String? createdAt;
  String? updatedAt;
  int? catId;
  List<String>? images;

  Productdetails(
      {this.id,
      this.brandId,
      this.productName,
      this.offerPrice,
      this.price,
      this.sellingRate,
      this.sellingMrp,
      this.description,
      this.status,
      this.hsncode,
      this.priority,
      this.prate,
      this.noReturnDays,
      this.b2cStatus,
      this.createdAt,
      this.updatedAt,
      this.catId,
      this.images});

  Productdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    productName = json['product_name'];
    offerPrice = doubleAmount((json['offer_price']??0).toString());
    price = doubleAmount((json['price']??0).toString());
    sellingRate = doubleAmount((json['selling_rate']??0).toString());
    sellingMrp = json['selling_mrp'];
    description = json['description'];
    status = json['status'];
    hsncode = json['hsncode'];
    priority = json['priority'];
    prate = json['prate'];
    noReturnDays = json['no_return_days'];
    b2cStatus = json['b2c_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    catId = json['cat_id'];
    images = json['images'].cast<String>();
  }


}
