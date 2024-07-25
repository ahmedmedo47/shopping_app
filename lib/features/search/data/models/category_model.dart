class CategoryModel {
  final int id;
  final int parentId;
  final String imageUrl;
  final String size;
  final String title;

  CategoryModel({
    required this.id,
    required this.parentId,
    required this.imageUrl,
    required this.size,
    required this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      parentId: json['parent_id'],
      imageUrl: json['image_url'],
      size: json['size'],
      title: json['title'],
    );
  }
}
