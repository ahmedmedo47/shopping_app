class File {
  String? id;
  String? type;
  String? title;
  String? additionalPrice;
  List<dynamic>? options;

  File({
    this.id,
    this.type,
    this.title,
    this.additionalPrice,
    this.options,
  });

  factory File.fromJson(Map<String, dynamic> json) => File(
        id: json['id'] as String?,
        type: json['type'] as String?,
        title: json['title'] as String?,
        additionalPrice: json['additional_price'] as String?,
        options: json['options'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'title': title,
        'additional_price': additionalPrice,
        'options': options,
      };
}
