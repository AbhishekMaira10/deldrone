import 'package:flutter/material.dart';
import 'package:deldrone_customer/models/category_model.dart';
import 'package:deldrone_customer/services/category_service.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize() {
    _loadCategories();
  }

  _loadCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}
