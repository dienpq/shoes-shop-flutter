class CustomerModel {
  int id;
  String name;
  String email;
  String phoneNum;
  String address;

  CustomerModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNum,
      required this.address});

  get getId => id;

  set setId(id) => this.id = id;

  get getName => name;

  set setName(name) => this.name = name;

  get getEmail => email;

  set setEmail(email) => this.email = email;

  get getPhoneNum => phoneNum;

  set setPhoneNum(phoneNum) => this.phoneNum = phoneNum;

  get getAddress => address;

  set setAddress(address) => this.address = address;
}
