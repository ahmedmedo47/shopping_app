class Option {
  String? id;
  String? title;
  String? type;
  dynamic additionalPrice;
  List<dynamic>? additionalPriceBreakdown;

  Option({
    this.id,
    this.title,
    this.type,
    this.additionalPrice,
    this.additionalPriceBreakdown,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      additionalPrice: json['additional_price'],
      additionalPriceBreakdown: json['additional_price_breakdown'] != null
          ? (json['additional_price_breakdown'] is List
          ? List<dynamic>.from(json['additional_price_breakdown'])
          : [])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'additional_price': additionalPrice,
      'additional_price_breakdown': additionalPriceBreakdown,
    };
  }
}
