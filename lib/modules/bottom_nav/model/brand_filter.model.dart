class BrandFilterModel {
  bool? error;
  List<Product>? product;
  String? message;

  BrandFilterModel({this.error, this.product, this.message});

  BrandFilterModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add( Product.fromJson(v));
      });
    }
    message = json['message'];
  }


}

class Product {
  int? id;
  int? brandId;
  String? productName;
  int? offerPrice;
  int? price;
  int? sellingRate;
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
  String? images;

  Product(
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
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    productName = json['product_name'];
    offerPrice = json['offer_price'];
    price = json['price'];
    sellingRate = json['selling_rate'];
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
    images = json['images'];
  }

 
}
