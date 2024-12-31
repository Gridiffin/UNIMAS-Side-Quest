// models/servicemodel.dart
class ServiceModel {
  final String id;
  final String title;
  final String description;
  final double price;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  // Convert a JSON map to a ServiceModel instance
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
    );
  }

  // Convert a ServiceModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
    };
  }
}
