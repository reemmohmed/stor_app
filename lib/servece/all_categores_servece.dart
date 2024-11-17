import 'package:stor_app/helper/api.dart';

class AllCategoresServece {
  Future<List<dynamic>> getAllcategores() async {
    List<dynamic> data =
        await Api().get(uri: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
