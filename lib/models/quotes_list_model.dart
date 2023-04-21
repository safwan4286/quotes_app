class QuotesListModel {
  String? flag;
  String? counter;
  String? currentpage;
  List<ProductList>? productList;

  QuotesListModel(
      {this.flag, this.counter, this.currentpage, this.productList});

  QuotesListModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    counter = json['counter'];
    currentpage = json['currentpage'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    data['counter'] = counter;
    data['currentpage'] = currentpage;
    if (productList != null) {
      data['product_list'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  int? productId;
  String? productTitle;
  String? productImage;
  int? categoryId;
  String? categoryName;

  ProductList(
      {this.productId,
      this.productTitle,
      this.productImage,
      this.categoryId,
      this.categoryName});

  ProductList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productTitle = json['product_title'];
    productImage = json['product_image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_title'] = productTitle;
    data['product_image'] = productImage;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
