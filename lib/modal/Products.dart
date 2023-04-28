class products{
  int? id;
  String? title;
  String? description;
  String? price;
  double? discountPercentage;
  double? rating;
  String? stock;
  String? brand;
  String? category;
  String? thumbnail;
  String? images;


  products(
      {
        this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images
      });

  products.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'];
  }
}