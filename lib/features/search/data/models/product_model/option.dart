import 'package:equatable/equatable.dart';

class Option extends Equatable {
  final String? id;
  final String? title;
  final String? type;
  final dynamic additionalPrice;
  final List<dynamic>? additionalPriceBreakdown;

  const Option({
    this.id,
    this.title,
    this.type,
    this.additionalPrice,
    this.additionalPriceBreakdown,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json['id'] as String?,
        title: json['title'] as String?,
        type: json['type'] as String?,
        additionalPriceBreakdown:
            json['additional_price_breakdown'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'additional_price': additionalPrice,
        'additional_price_breakdown': additionalPriceBreakdown,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      type,
      additionalPrice,
      additionalPriceBreakdown,
    ];
  }
}
