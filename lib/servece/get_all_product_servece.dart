import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/pruduct_model.dart';

class AllProductServece {
  Future<List<ProductModel>> getallpruducts() async {
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products',
    );
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productList;
  }
}
