import 'package:equatable/equatable.dart';

class Technique extends Equatable {
  final String? key;
  final String? displayName;
  final bool? isDefault;

  const Technique({this.key, this.displayName, this.isDefault});

  factory Technique.fromJson(Map<String, dynamic> json) => Technique(
        key: json['key'] as String?,
        displayName: json['display_name'] as String?,
        isDefault: json['is_default'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'display_name': displayName,
        'is_default': isDefault,
      };

  @override
  List<Object?> get props => [key, displayName, isDefault];
}
