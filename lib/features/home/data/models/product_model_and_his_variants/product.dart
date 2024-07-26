import 'file.dart';
import 'technique.dart';

class Product {
  int? id;
  int? mainCategoryId;
  String? type;
  String description;
  String? typeName;
  String? title;
  String? brand; // Assuming brand is a String
  String? model;
  String? image;
  int? variantCount;
  String? currency;
  List<dynamic>? options; // Consider replacing with a specific type if possible
  dynamic dimensions; // Replace with a specific type if known
  bool? isDiscontinued;
  dynamic avgFulfillmentTime; // Replace with a specific type if known
  List<Technique>? techniques;
  List<File>? files;
  String? originCountry; // Assuming originCountry is a String

  Product({
    this.id,
    this.mainCategoryId,
    this.type,
    required this.description,
    this.typeName,
    this.title,
    this.brand,
    this.model,
    this.image,
    this.variantCount,
    this.currency,
    this.options,
    this.dimensions,
    this.isDiscontinued,
    this.avgFulfillmentTime,
    this.techniques,
    this.files,
    this.originCountry,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int?,
    mainCategoryId: json['main_category_id'] as int?,
    type: json['type'] as String?,
    description: json['description'] as String,
    typeName: json['type_name'] as String?,
    title: json['title'] as String?,
    brand: json['brand'] as String?, // Assuming brand is a String
    model: json['model'] as String?,
    image: json['image'] as String?,
    variantCount: json['variant_count'] as int?,
    currency: json['currency'] as String?,
    options: json['options'] as List<dynamic>?, // Consider specifying the type
    dimensions: json['dimensions'], // Replace with a specific type if known
    isDiscontinued: json['is_discontinued'] as bool?,
    avgFulfillmentTime: json['avg_fulfillment_time'], // Replace with a specific type if known
    techniques: (json['techniques'] as List<dynamic>?)
        ?.map((e) => Technique.fromJson(e as Map<String, dynamic>))
        .toList(),
    files: (json['files'] as List<dynamic>?)
        ?.map((e) => File.fromJson(e as Map<String, dynamic>))
        .toList(),
    originCountry: json['origin_country'] as String?, // Assuming originCountry is a String
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'main_category_id': mainCategoryId,
    'type': type,
    'description': description,
    'type_name': typeName,
    'title': title,
    'brand': brand,
    'model': model,
    'image': image,
    'variant_count': variantCount,
    'currency': currency,
    'options': options,
    'dimensions': dimensions, // Replace with a specific type if known
    'is_discontinued': isDiscontinued,
    'avg_fulfillment_time': avgFulfillmentTime, // Replace with a specific type if known
    'techniques': techniques?.map((e) => e.toJson()).toList(),
    'files': files?.map((e) => e.toJson()).toList(),
    'origin_country': originCountry,
  };
}
