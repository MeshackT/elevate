import 'package:cloud_firestore/cloud_firestore.dart'; // For Firestore timestamp

enum Category {
  men,
  women,
  kids,
}

class ProductModel {
  final String id; // Document ID from Firebase
  final String name;
  final String description;
  final List<String> image;
  final double newPrice;
  final double oldPrice;
  final Category category;
  final Timestamp timestamp; // For storing timestamp from Firebase

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.newPrice,
    required this.oldPrice,
    required this.category,
    required this.timestamp,
  });

  // Convert a ProductModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'new_price': newPrice,
      'old_price': oldPrice,
      'category': category.toString().split('.').last,
      'timestamp': timestamp,
    };
  }

  // Convert a map to a ProductModel instance
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: List<String>.from(map['image']),
      newPrice: map['new_price'].toDouble(),
      oldPrice: map['old_price'].toDouble(),
      category: Category.values.firstWhere(
        (e) => e.toString().split('.').last == map['category'],
      ),
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}

//
// Future<void> getProducts() async {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final CollectionReference productsRef = firestore.collection('products');
//
//   QuerySnapshot querySnapshot = await productsRef.get();
//   List<ProductModel> products = querySnapshot.docs.map((doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return ProductModel.fromMap(data, doc.id);
//   }).toList();
//
//   // Now you have a list of ProductModel instances
// }
