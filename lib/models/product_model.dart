class ProductModel {
  String id;
  String name;
  String imagePath;
  String desc;
  String brand;
  String color;
  int soldNum;
  int discount = 0;
  double price;

  ProductModel(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.desc,
      required this.brand,
      required this.color,
      required this.soldNum,
      required this.discount,
      required this.price});

  get getId => id;

  set setId(id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getImageUrl => imagePath;

  set setImageUrl(imageUrl) => imagePath = imageUrl;

  get getDesc => desc;

  set setDesc(desc) => this.desc = desc;

  get getBrand => brand;

  set setBrand(brand) => this.brand = brand;

  get getColor => color;

  set setColor(color) => this.color = color;

  get getPrice => price;

  set setPrice(price) => this.price = price;

  String getInfo() {
    return "$id - $name - $price";
  }
}
