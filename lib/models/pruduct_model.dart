class ProductModel {
  final int id;
  final String title;
  final double pric;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.pric,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromjson(Map<String, dynamic> JsonData) {
    return ProductModel(
        id: JsonData['id'],
        title: JsonData['title'],
        pric: (JsonData['price'] as num).toDouble(),
        description: JsonData['description'],
        category: JsonData['category'],
        image: JsonData['image'],
        rating: JsonData['rating'] != null
            ? RatingModel.fromjson(JsonData['rating'])
            : RatingModel(rate: 0.0, count: 0)); // التعامل مع null
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(Map<String, dynamic> JsonData) {
    return RatingModel(
        rate: (JsonData['rate'] as num).toDouble(),
        count: JsonData['count'] as int);
  }
}
