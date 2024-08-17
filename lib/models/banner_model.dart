import 'package:cloud_firestore/cloud_firestore.dart'; // For Firestore timestamp

enum Category {
  men,
  women,
  kids,
}

class BannerModel {
  final String id; // Document ID from Firebase
  final String image;
  final Category category;
  final Timestamp timestamp; // For storing timestamp from Firebase

  BannerModel({
    required this.id,
    required this.image,
    required this.category,
    required this.timestamp,
  });

  // Convert a ProductModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'category': category.toString().split('.').last,
      'timestamp': timestamp,
    };
  }

  // Convert a map to a ProductModel instance
  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      image: map['image'],
      category: Category.values.firstWhere(
        (e) => e.toString().split('.').last == map['category'],
      ),
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}
