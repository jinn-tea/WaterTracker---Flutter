import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Sage_Box.dart';



class AddWater extends StatelessWidget {
  const AddWater({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add your drink volume')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 150),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Enter Or Choose One Below',
                style: TextStyle(fontSize: 24),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: SageBox(
                    ContainerType: 'Glass',
                    ContainerSize: '200 ml',
                    icon: const Icon(FontAwesomeIcons.glassWater),
                    disIcon: 70.0,
                    onPress: () {
                      Navigator.pop(context, 200);
                    },
                  ),
                ),
                Expanded(
                  child: SageBox(
                    ContainerType: 'Small Bottle',
                    ContainerSize: '330 ml',
                    icon: const Icon(FontAwesomeIcons.bottleWater),
                    disIcon: 70.0,
                    onPress: () {
                      Navigator.pop(context, 330);
                    },
                  ),
                ),
                Expanded(
                  child: SageBox(
                    ContainerType: 'Large Bottle',
                    ContainerSize: '500 ml',
                    icon: const Icon(FontAwesomeIcons.bottleWater),
                    disIcon: 70.0,
                    onPress: () {
                      Navigator.pop(context, 500);
                    },
                  ),
                ),
              ],
            ),

            Expanded(
              child: SageBox(
                ContainerType: 'Sports Bottle',
                ContainerSize: '750 ml',
                icon: const Icon(FontAwesomeIcons.glassWaterDroplet),
                disIcon: 310.0,
                onPress: () {
                  Navigator.pop(context, 750);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
