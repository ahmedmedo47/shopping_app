import 'availability_regions.dart';
import 'availability_status.dart';

class Variant {
  int? id;
  int? productId;
  String? name;
  String? size;
  String? color;
  String? colorCode;
  dynamic colorCode2;
  String? image;
  String? price;
  bool? inStock;
  AvailabilityRegions? availabilityRegions;
  List<AvailabilityStatus>? availabilityStatus;
  List<dynamic>? material;

  Variant({
    this.id,
    this.productId,
    this.name,
    this.size,
    this.color,
    this.colorCode,
    this.colorCode2,
    this.image,
    this.price,
    this.inStock,
    this.availabilityRegions,
    this.availabilityStatus,
    this.material,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json['id'] as int?,
        productId: json['product_id'] as int?,
        name: json['name'] as String?,
        size: json['size'] as String?,
        color: json['color'] as String?,
        colorCode: json['color_code'] as String?,
        colorCode2: json['color_code2'] as dynamic,
        image: json['image'] as String?,
        price: json['price'] as String?,
        inStock: json['in_stock'] as bool?,
        availabilityRegions: json['availability_regions'] == null
            ? null
            : AvailabilityRegions.fromJson(
                json['availability_regions'] as Map<String, dynamic>),
        availabilityStatus: (json['availability_status'] as List<dynamic>?)
            ?.map((e) => AvailabilityStatus.fromJson(e as Map<String, dynamic>))
            .toList(),
        material: json['material'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'name': name,
        'size': size,
        'color': color,
        'color_code': colorCode,
        'color_code2': colorCode2,
        'image': image,
        'price': price,
        'in_stock': inStock,
        'availability_regions': availabilityRegions?.toJson(),
        'availability_status':
            availabilityStatus?.map((e) => e.toJson()).toList(),
        'material': material,
      };
}
