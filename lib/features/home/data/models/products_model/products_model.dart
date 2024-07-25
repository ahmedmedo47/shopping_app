import 'file.dart';
import 'option.dart';
import 'technique.dart';

class ProductsModel {
  int? id;
  int? mainCategoryId;
  String? type;
  String description;
  String? typeName;
  String title;
  String? brand;
  String? model;
  String image;
  int? variantCount;
  String? currency;
  List<Option>? options;
  dynamic dimensions;
  bool? isDiscontinued;
  dynamic avgFulfillmentTime;
  List<Technique>? techniques;
  List<File>? files;
  dynamic originCountry;

  ProductsModel({
    this.id,
    this.mainCategoryId,
    this.type,
    required this.description,
    this.typeName,
    required this.title,
    this.brand,
    this.model,
    required this.image,
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

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['id'] as int?,
        mainCategoryId: json['main_category_id'] as int?,
        type: json['type'] as String?,
        description: json['description'] as String,
        typeName: json['type_name'] as String?,
        title: json['title'] as String,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
        image: json['image'] as String,
        variantCount: json['variant_count'] as int?,
        currency: json['currency'] as String?,
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        dimensions: json['dimensions'] as dynamic,
        isDiscontinued: json['is_discontinued'] as bool?,
        avgFulfillmentTime: json['avg_fulfillment_time'] as dynamic,
        techniques: (json['techniques'] as List<dynamic>?)
            ?.map((e) => Technique.fromJson(e as Map<String, dynamic>))
            .toList(),
        files: (json['files'] as List<dynamic>?)
            ?.map((e) => File.fromJson(e as Map<String, dynamic>))
            .toList(),
        originCountry: json['origin_country'] as dynamic,
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
        'options': options?.map((e) => e.toJson()).toList(),
        'dimensions': dimensions,
        'is_discontinued': isDiscontinued,
        'avg_fulfillment_time': avgFulfillmentTime,
        'techniques': techniques?.map((e) => e.toJson()).toList(),
        'files': files?.map((e) => e.toJson()).toList(),
        'origin_country': originCountry,
      };
}
