import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/pruduct_model.dart';

class AddProduct {
  Future<ProductModel> addproducts(
      {required title,
      required descraption,
      required price,
      required image,
      required category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        "description": descraption,
        "image": image,
        "category": category
      },
    );
    return ProductModel.fromjson(data);
  }
}
