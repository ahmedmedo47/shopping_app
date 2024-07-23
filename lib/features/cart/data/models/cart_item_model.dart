class CartItemModel {
  final String imageUrl;
  final double price;
  final String title;
  final String size;
  int count;

  CartItemModel({
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.size,
    this.count = 1,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      title: map['title'] as String,
      count: map['count'] as int,
      size: map['size'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'price': price,
      'title': title,
      'count': count,
      'size': size
    };
  }
}
