class ProductListModel {
  bool? error;
  List<ProductList>? productList;
  String? message;

  ProductListModel({this.error, this.productList, this.message});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['productlist'] != null) {
      productList = <ProductList>[];
      json['productlist'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
    message = json['message'];
  }


}

class ProductList {
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

  ProductList(
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

  ProductList.fromJson(Map<String, dynamic> json) {
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
