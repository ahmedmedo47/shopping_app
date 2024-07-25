import 'package:equatable/equatable.dart';

class File extends Equatable {
  final String? id;
  final String? type;
  final String? title;
  final String? additionalPrice;
  final List<dynamic>? options;

  const File({
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

  @override
  List<Object?> get props => [id, type, title, additionalPrice, options];
}
