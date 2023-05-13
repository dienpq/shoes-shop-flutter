import 'package:app_shoes__shop/models/notification_model.dart';
import 'package:app_shoes__shop/ultilities/color.dart';
import 'package:app_shoes__shop/ultilities/data.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Notifications",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black),
              ),
              Container(
                width: size.width / 7,
                padding: const EdgeInsets.only(left: 0),
                color: ColorUtils.primaryColor,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded, color: ColorUtils.primaryBgColor)),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Today',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
        const SizedBox(height: 10),
        getNotification('Today'),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Yesterday',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
        const SizedBox(height: 10),
        getNotification('Yesterday'),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Last Month',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
        const SizedBox(height: 10),
        getNotification('Last Month'),
        const SizedBox(height: 40)
      ],
    );
  }

  Widget getNotification(time) {
    List<NotificationModel> displayList = notifications
        .where((notification) => notification.time == time)
        .toList();
    return Column(
      children: List.generate(displayList.length, (index) {
        String type = displayList[index].type;
        IconData icon = Icons.abc;
        switch (type) {
          case 'discount':
            icon = Icons.percent;
            break;

          case 'connect':
            icon = Icons.link;
            break;

          case 'order':
            icon = Icons.receipt;
            break;

          default:
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                ]),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorUtils.primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(displayList[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          Text(displayList[index].time,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54))
                        ],
                      ),
                      const SizedBox(height: 7),
                      Text(displayList[index].content),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
