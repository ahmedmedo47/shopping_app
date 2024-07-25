import 'product.dart';
import 'variant.dart';

class ProductModelAndHisVariants {
  Product? product;
  List<Variant>? variants;

  ProductModelAndHisVariants({this.product, this.variants});

  factory ProductModelAndHisVariants.fromJson(Map<String, dynamic> json) {
    return ProductModelAndHisVariants(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'variants': variants?.map((e) => e.toJson()).toList(),
      };
}
