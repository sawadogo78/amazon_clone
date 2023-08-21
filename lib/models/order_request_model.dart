class OrderRequestModel {
  final String orderName;
  final String buyerAddress;
  OrderRequestModel({
    required this.orderName,
    required this.buyerAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderName': orderName,
      'buyerAddress': buyerAddress,
    };
  }

  factory OrderRequestModel.fromJson(Map<String, dynamic> map) {
    return OrderRequestModel(
      orderName: map['orderName'],
      buyerAddress: map['buyerAddress'],
    );
  }
}
