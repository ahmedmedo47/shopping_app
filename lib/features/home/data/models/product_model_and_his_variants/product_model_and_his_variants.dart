import 'product.dart';
import 'variant.dart';

class ProductModelAndHisVariants {
  final Product product;
  final List<Variant> variants;

  ProductModelAndHisVariants({
    required this.product,
    required this.variants,
  });

  factory ProductModelAndHisVariants.fromJson(Map<String, dynamic> json) {
    return ProductModelAndHisVariants(
      product: Product.fromJson(json['product']),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variant.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'variants': variants.map((v) => v.toJson()).toList(),
    };
  }
}
