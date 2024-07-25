class Technique {
  String? key;
  String? displayName;
  bool? isDefault;

  Technique({this.key, this.displayName, this.isDefault});

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
}
