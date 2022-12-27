List<ProductModel> productsFromJson(dynamic str) =>
    List<ProductModel>.from((str).map((x) => ProductModel.fromJson(x)));

class ProductModel {
  int? productId;
  int? sellerId;
  String? brand;
  String? title;
  String? productDetail;
  String? image;
  int? price;
  int? deliveryFee;
  String? createAt;
  String? updateAt;
  int? funding;
  int? fundingSum;
  String? category;
  String? expireDate;

  ProductModel(
    this.productId,
    this.sellerId,
    this.brand,
    this.title,
    this.productDetail,
    this.image,
    this.price,
    this.deliveryFee,
    this.createAt,
    this.updateAt,
    this.funding,
    this.fundingSum,
    this.category,
    this.expireDate,
  );

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    sellerId = json['seller_id'];
    brand = json['brand'];
    title = json['title'];
    productDetail = json['product_detail'];
    image = json['image'];
    price = json['price'];
    deliveryFee = json['delivery_fee'];
    createAt = json['created_at'];
    updateAt = json['update_at'];
    funding = json['funding'];
    fundingSum = json['funding_sum'];
    category = json['category'];
    expireDate = json['expire_date'];
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId.toString(),
        "seller_id": sellerId.toString(),
        "brand": brand,
        "title": title,
        "product_detail": productDetail,
        "image": image,
        "price": price.toString(),
        "delivery_fee": deliveryFee.toString(),
        "created_at": createAt,
        "update_at": updateAt,
        "funding": funding.toString(),
        "funding_sum": fundingSum.toString(),
        "category": category,
        "expire_date": expireDate,
      };
}
