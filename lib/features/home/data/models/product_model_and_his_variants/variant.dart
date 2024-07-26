import 'availability_regions.dart';

class Variant {
  int? id;
  int? productId;
  String name;
  String size;
  String? color;
  String colorCode;
  String? colorCode2; // Changed to String? for type safety
  String image;
  String price;
  bool? inStock;
  AvailabilityRegions? availabilityRegions;
  List<dynamic>? material;
  int count;

  Variant({
    this.id,
    this.productId,
    required this.name,
    required this.size,
    this.color,
    required this.colorCode,
    this.colorCode2,
    required this.image,
    required this.price,
    this.inStock,
    this.availabilityRegions,
    this.material,
    this.count = 1,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json['id'] as int?,
        productId: json['product_id'] as int?,
        name: json['name'] as String,
        size: json['size'] as String,
        color: json['color'] as String?,
        colorCode: json['color_code'] as String,
        colorCode2: json['color_code2']
            as String?, // Changed to String? for type safety
        image: json['image'] as String,
        price: json['price'] as String,
        inStock: json['in_stock'] as bool?,
        availabilityRegions: json['availability_regions'] == null
            ? null
            : AvailabilityRegions.fromJson(
                json['availability_regions'] as Map<String, dynamic>),

        material: json['material'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'name': name,
        'size': size,
        'color': color,
        'color_code': colorCode,
        'color_code2': colorCode2, // Changed to String? for type safety
        'image': image,
        'price': price,
        'in_stock': inStock,
        'availability_regions': availabilityRegions?.toJson(),
        'material': material,
      };
  double get priceAsDouble {
    return double.tryParse(price) ?? 0.0;
  }
}
