import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/pruduct_model.dart';

class UpdatProductServece {
  Future<ProductModel> updat({
    required String title,
    required String descraption,
    required double price,
    required String image,
    required int id,
    required String category,
  }) async {
    // تحويل البيانات إلى Map<String, dynamic> بشكل صحيح
    Map<String, dynamic> body = {
      'title': title,
      'price':
          price, // تأكد من أن السعر ليس من النوع String هنا، فقط حوله في place where needed
      'description': descraption,
      'image': image,
      'category': category,
    };

    // ارسال البيانات باستخدام Api().put
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: body,
      token: 'your_token_here', // إذا كنت تستخدم التوكن
    );

    // تحويل البيانات المستلمة إلى ProductModel
    return ProductModel.fromjson(data);
  }
}
