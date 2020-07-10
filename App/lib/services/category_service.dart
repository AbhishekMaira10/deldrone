import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deldrone_customer/models/category_model.dart';

class CategoryServices {
  String collection = "categories";
  Firestore _fireStore = Firestore.instance;

  Future<List<CategoryModel>> getCategories() async =>
      _fireStore.collection(collection).getDocuments().then((result) {
        List<CategoryModel> categories = [];
        for (DocumentSnapshot category in result.documents) {
          categories.add(CategoryModel.fromSnapshot(category));
        }
        return categories;
      });
}
