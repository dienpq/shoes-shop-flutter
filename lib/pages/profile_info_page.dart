import 'package:app_shoes__shop/models/user_model.dart';
import 'package:app_shoes__shop/ultilities/action.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:flutter/material.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          'My Information',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.info_outline_rounded,
              color: Colors.black.withOpacity(0.8),
              size: 28,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return FutureBuilder<UserModel>(
      future: fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data!;

          return Center(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.fromLTRB(10, 7, 12, 7),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    initialValue: user.fullname,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    // readOnly: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Fill in your name",
                        prefixIcon: Icon(Icons.person,
                            color: Color.fromARGB(255, 55, 151, 98)),
                        // suffixIcon:
                        //     Icon(Icons.edit, color: Color.fromARGB(255, 55, 151, 98)),
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 200, 199, 204),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.fromLTRB(10, 7, 12, 7),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    initialValue: user.birthday,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    // readOnly: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Fill in your birthday",
                        prefixIcon: Icon(Icons.calendar_month,
                            color: Color.fromARGB(255, 55, 151, 98)),
                        // suffixIcon:
                        //     Icon(Icons.edit, color: Color.fromARGB(255, 55, 151, 98)),
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 200, 199, 204),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.fromLTRB(10, 7, 12, 7),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    initialValue: user.email,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    // readOnly: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Fill in your email",
                        prefixIcon: Icon(Icons.mail,
                            color: Color.fromARGB(255, 55, 151, 98)),
                        // suffixIcon:
                        //     Icon(Icons.edit, color: Color.fromARGB(255, 55, 151, 98)),
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 200, 199, 204),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.fromLTRB(10, 7, 12, 7),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    initialValue: user.phoneNum,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    // readOnly: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Fill in your phone number",
                        prefixIcon: Icon(Icons.phone,
                            color: Color.fromARGB(255, 55, 151, 98)),
                        // suffixIcon:
                        //     Icon(Icons.edit, color: Color.fromARGB(255, 55, 151, 98)),
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 200, 199, 204),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.fromLTRB(10, 7, 12, 7),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    initialValue: user.address,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    // readOnly: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Fill in your address",
                        prefixIcon: Icon(Icons.location_on,
                            color: Color.fromARGB(255, 55, 151, 98)),
                        // suffixIcon:
                        //     Icon(Icons.edit, color: Color.fromARGB(255, 55, 151, 98)),
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 200, 199, 204),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                    height: 220,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            color: ColorUtils.primaryColor,
                            size: 70,
                          ),
                          Text('Click to get your location',
                              style: TextStyle(
                                color: ColorUtils.primaryColor,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Failed to fetch user');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
