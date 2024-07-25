class CategoriesModel {
  int? id;
  int? parentId;
  String? imageUrl;
  int? catalogPosition;
  String? size;
  String? title;

  CategoriesModel({
    this.id,
    this.parentId,
    this.imageUrl,
    this.catalogPosition,
    this.size,
    this.title,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json['id'] as int?,
        parentId: json['parent_id'] as int?,
        imageUrl: json['image_url'] as String?,
        catalogPosition: json['catalog_position'] as int?,
        size: json['size'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent_id': parentId,
        'image_url': imageUrl,
        'catalog_position': catalogPosition,
        'size': size,
        'title': title,
      };
}
