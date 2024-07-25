class ProductModel {
  final int id;
  final int mainCategoryId;
  final String? type;
  final String? description;
  final String? typeName;
  final String? title;
  final String? brand;
  final String? model;
  final String? image;
  final int variantCount;
  final String currency;
  final bool isDiscontinued;
  final List<dynamic> options;
  final List<dynamic> techniques;
  final List<dynamic> files;
  final double? avgFulfillmentTime;
  final String? originCountry;

  ProductModel({
    required this.id,
    required this.mainCategoryId,
    required this.type,
    required this.description,
    required this.typeName,
    required this.title,
    required this.brand,
    required this.model,
    required this.image,
    required this.variantCount,
    required this.currency,
    required this.isDiscontinued,
    required this.options,
    required this.techniques,
    required this.files,
    this.avgFulfillmentTime,
    this.originCountry,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      mainCategoryId: json['main_category_id'],
      type: json['type'],
      description: json['description'],
      typeName: json['type_name'],
      title: json['title'],
      brand: json['brand'],
      model: json['model'],
      image: json['image'],
      variantCount: json['variant_count'],
      currency: json['currency'],
      isDiscontinued: json['is_discontinued'],
      options: json['options'] ?? [],
      techniques: json['techniques'] ?? [],
      files: json['files'] ?? [],
      avgFulfillmentTime: (json['avg_fulfillment_time'] != null)
          ? json['avg_fulfillment_time'].toDouble()
          : null,
      originCountry: json['origin_country'],
    );
  }
}
