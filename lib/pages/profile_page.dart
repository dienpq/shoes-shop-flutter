import 'package:app_shoes__shop/models/user_model.dart';
import 'package:app_shoes__shop/pages/components/profile_widget.dart';
import 'package:app_shoes__shop/pages/login.dart';
import 'package:app_shoes__shop/pages/my_order_page.dart';
import 'package:app_shoes__shop/pages/notification_page.dart';
import 'package:app_shoes__shop/pages/profile_info_page.dart';
import 'package:app_shoes__shop/ultilities/constants.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Stack(children: [
          CustomPaint(
            painter: HeaderCurvedContainer(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            width: size.width,
            child: FutureBuilder<UserModel>(
              future: fetchUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Profile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28)),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const NotificationPage()));
                              },
                              child: const Icon(Icons.notifications,
                                  color: Colors.white, size: 27))
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromARGB(255, 14, 104, 54)),
                                image: DecorationImage(
                                    image: AssetImage(user.avatar),
                                    fit: BoxFit.cover)),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.fullname,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Visibility(
                        visible: false,
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        child: Text(
                          user.email,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text('Failed to fetch user');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ]),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size.width / 2 - 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                children: [
                  Icon(
                    Icons.list_alt_outlined,
                    color: primaryColor,
                    size: 65,
                  ),
                  Text("Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.7))),
                  Text("50",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8))),
                ],
              ),
            ),
            Container(
              width: size.width / 2 - 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                children: [
                  Icon(
                    Icons.confirmation_number_outlined,
                    color: primaryColor,
                    size: 65,
                  ),
                  Text("Vouchers",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.7))),
                  Text("20",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8))),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ProfileInfoPage()));
                  },
                  child: const ProfileWidget(
                    icon: Icons.person,
                    title: 'My Profile',
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const MyOrderPage()));
                  },
                  child: const ProfileWidget(
                    icon: Icons.chat,
                    title: 'My Orders ',
                  ),
                ),
                const Divider(),
                const ProfileWidget(
                  icon: Icons.settings,
                  title: 'Settings',
                ),
                const Divider(),
                const ProfileWidget(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),
                const Divider(),
                const ProfileWidget(
                  icon: Icons.share,
                  title: 'Share',
                ),
                const Divider(),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('token');
                  },
                  child: const ProfileWidget(
                    icon: Icons.logout,
                    title: 'Log Out',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    )));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = primaryColor;
    Path path = Path()
      ..relativeLineTo(0, 225)
      ..quadraticBezierTo(size.width / 2, 310, size.width, 225)
      ..relativeLineTo(0, -250)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
