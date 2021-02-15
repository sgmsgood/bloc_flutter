class Date{
  final String maximum;
  final String minimum;

  Date({this.maximum, this.minimum});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date (
      maximum: json['maximum'],
      minimum: json['minimum']
    );
  }
}