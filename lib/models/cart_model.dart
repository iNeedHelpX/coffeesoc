class CartItemModel {
  CartItemModel(
      {this.productId,
      this.id,
      this.image,
      this.name,
      this.quantity,
      required this.price,
      this.cost});

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    productId = data[PRODUCT_ID];
    price = data[PRICE];
  }

  static const COST = "cost";
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";
  static const QUANTITY = "quantity";

  double? cost;
  String? id;
  String? image;
  String? name;
  double? price;
  String? productId;
  int? quantity;

  Map toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price! * quantity!,
        PRICE: price
      };
}
