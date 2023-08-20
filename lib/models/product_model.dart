class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int numOfRating;
  ProductModel({
    required this.url,
    required this.productName,
    required this.cost,
    required this.discount,
    required this.uid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.numOfRating,
  });

  ProductModel copyWith({
    String? url,
    String? productName,
    double? cost,
    int? discount,
    String? uid,
    String? sellerName,
    String? sellerUid,
    int? rating,
    int? numOfRating,
  }) {
    return ProductModel(
      url: url ?? this.url,
      productName: productName ?? this.productName,
      cost: cost ?? this.cost,
      discount: discount ?? this.discount,
      uid: uid ?? this.uid,
      sellerName: sellerName ?? this.sellerName,
      sellerUid: sellerUid ?? this.sellerUid,
      rating: rating ?? this.rating,
      numOfRating: numOfRating ?? this.numOfRating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'productName': productName,
      'cost': cost,
      'discount': discount,
      'uid': uid,
      'sellerName': sellerName,
      'sellerUid': sellerUid,
      'rating': rating,
      'numOfRating': numOfRating,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      url: map['url'],
      productName: map['productName'],
      cost: map['cost'],
      discount: map['discount'],
      uid: map['uid'],
      sellerName: map['sellerName'],
      sellerUid: map['sellerUid'],
      rating: map['rating'],
      numOfRating: map['numOfRating'],
    );
  }
}
