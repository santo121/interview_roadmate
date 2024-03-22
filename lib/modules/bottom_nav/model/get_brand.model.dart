class BrandListModel {
  bool? error;
  List<BrandList>? brandList;
  String? message;

  BrandListModel({this.error, this.brandList, this.message});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['brandlist'] != null) {
      brandList = <BrandList>[];
      json['brandlist'].forEach((v) {
        brandList!.add(BrandList.fromJson(v));
      });
    }
    message = json['message'];
  }


}

class BrandList {
  int? id;
  int? catId;
  String? brandName;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? checkMark;

  BrandList(
      {this.id,
      this.catId,
      this.brandName,
      this.status,
      this.vendorId,
      this.createdAt,
      this.updatedAt,
      this.checkMark = false,
      });

  BrandList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    brandName = json['brand_name'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    checkMark = false;
  }

}
