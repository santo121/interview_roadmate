class CategoryModel {
  bool? error;
  List<CategoryList>? categoryList;
  String? message;

  CategoryModel({this.error, this.categoryList, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['categorylist'] != null) {
      categoryList = <CategoryList>[];
      json['categorylist'].forEach((v) {
        categoryList!.add(CategoryList.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class CategoryList {
  int? id;
  String? categoryName;
  int? catId;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? status;

  CategoryList(
      {this.id,
      this.categoryName,
      this.catId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.status});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    catId = json['cat_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }
}
