class AvailabilityRegions {
  String? us;
  String? eu;
  String? euLv;
  String? uk;

  AvailabilityRegions({this.us, this.eu, this.euLv, this.uk});

  factory AvailabilityRegions.fromJson(Map<String, dynamic> json) {
    return AvailabilityRegions(
      us: json['US'] as String?,
      eu: json['EU'] as String?,
      euLv: json['EU_LV'] as String?,
      uk: json['UK'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'US': us,
        'EU': eu,
        'EU_LV': euLv,
        'UK': uk,
      };
}
