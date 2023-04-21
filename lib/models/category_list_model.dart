class CategoryListModel {
  String? flag;
  String? message;
  String? counter;
  String? currentpage;
  List<CategoryList>? categoryList;

  CategoryListModel(
      {this.flag,
      this.message,
      this.counter,
      this.currentpage,
      this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    message = json['message'];
    counter = json['counter'];
    currentpage = json['currentpage'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    data['message'] = message;
    data['counter'] = counter;
    data['currentpage'] = currentpage;
    if (categoryList != null) {
      data['category_list'] = categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int? categoryId;
  String? categoryName;
  String? categoryImage;

  CategoryList({this.categoryId, this.categoryName, this.categoryImage});

  CategoryList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    return data;
  }
}
