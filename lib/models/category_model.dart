class CategoryModel {
  int id;
  String name;
  String imgUrl;

  CategoryModel({required this.id, required this.name, required this.imgUrl});

  get getId => id;

  set setId(id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getImgUrl => imgUrl;

  set setImgUrl(imgUrl) => this.imgUrl = imgUrl;
}
