import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabDrawer extends StatelessWidget {
  final int lab;

  const LabDrawer({
    Key key,
    @required this.lab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: lab == 1
                ? null
                : () {
                    Get.offNamed('/lab1');
                  },
            child: Container(
              color: lab == 1 ? Colors.lightGreen : Colors.white,
              padding: EdgeInsets.only(left: 10.0),
              height: 40,
              alignment: Alignment.centerLeft,
              child: Text('Lab 1'),
            ),
          ),
          InkWell(
            onTap: lab == 2
                ? null
                : () {
                    Get.offNamed('/lab2');
                  },
            child: Container(
              color: lab == 2 ? Colors.lightGreen : Colors.white,
              padding: EdgeInsets.only(left: 10.0),
              height: 40,
              alignment: Alignment.centerLeft,
              child: Text('Lab 2'),
            ),
          ),
          InkWell(
            onTap: lab == 3
                ? null
                : () {
                    Get.offNamed('/lab3');
                  },
            child: Container(
              color: lab == 3 ? Colors.lightGreen : Colors.white,
              padding: EdgeInsets.only(left: 10.0),
              height: 40,
              alignment: Alignment.centerLeft,
              child: Text('Lab 3'),
            ),
          ),
          InkWell(
            onTap: lab == 4
                ? null
                : () {
                    Get.offNamed('/lab4');
                  },
            child: Container(
              color: lab == 4 ? Colors.lightGreen : Colors.white,
              padding: EdgeInsets.only(left: 10.0),
              height: 40,
              alignment: Alignment.centerLeft,
              child: Text('Lab 4'),
            ),
          ),
        ],
      ),
    );
  }
}
