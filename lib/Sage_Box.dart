import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watertracker2/constants.dart';





class SageBox extends StatelessWidget {
  final String ContainerType;
  final String ContainerSize;
  final Icon icon;
  final double disIcon;
  final Function? onPress;


  SageBox({
    required this.ContainerType,
    required this.ContainerSize,
    required this.icon,
    required this.disIcon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

          if (onPress != null) {
            onPress!();
          }

      },
      child: Container(
        height: 160,
        width: 100,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFc6e4e3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10,),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: icon,

              ),
            ),

            SizedBox(height: disIcon),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(ContainerType, style: KTextStyleContainerType,),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(ContainerSize, style: KTextStyleContainerSize),
            ),

          ],
        ),
      ),
    );
  }
}
