class SubCategoryListModel {
  bool? error;
  List<Subcategorylist>? subcategorylist;
  String? message;

  SubCategoryListModel({this.error, this.subcategorylist, this.message});

  SubCategoryListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['subcategorylist'] != null) {
      subcategorylist = <Subcategorylist>[];
      json['subcategorylist'].forEach((v) {
        subcategorylist!.add(Subcategorylist.fromJson(v));
      });
    }
    message = json['message'];
  }


}

class Subcategorylist {
  int? id;
  String? categoryName;
  int? catId;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? status;

  Subcategorylist(
      {this.id,
      this.categoryName,
      this.catId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.status});

  Subcategorylist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    catId = json['cat_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }
}
