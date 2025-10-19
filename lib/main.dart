import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watertracker2/constants.dart';
import 'add_water.dart';
import 'Container_type.dart';
import 'Brain.dart';
import 'GetDailyGoal.dart';

void main() {
  runApp(WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Water Tracker', home: WaterLevelPage());
  }
}

class WaterLevelPage extends StatefulWidget {
  const WaterLevelPage({super.key});

  @override
  State<WaterLevelPage> createState() => _WaterLevelPageState();
}

class _WaterLevelPageState extends State<WaterLevelPage> {
  int goal = 1000;
  late WaterBrain brain;
  @override
  void initState() {
    brain = WaterBrain(dailyTarget: goal, currentWater: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background

          // Water fill
          FractionallySizedBox(
            heightFactor: brain.waterLevel > 1 ? 1 : brain.waterLevel,
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFc6e4e3), Color(0xFFc6e4e4)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Text info
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 48),
                child: Text(
                  '${brain.remaining} ml to reach your daily target',
                  style: KTextStyleTop,
                ),
              ),
              Text('${brain.percent}%', style: KPercentageStyle),
              Text(
                '${brain.currentWater} / ${brain.dailyTarget} ml',
                style: KTextStyleBottom,
              ),
            ],
          ),
        ],
      ),

      // Buttons
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Settings
          Expanded(
            child: OutlinedButton(
              onPressed: () async {
                final dailyTarget = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Getdailygoal()),
                );

                if (dailyTarget != null) {
                  setState(() {
                    goal = dailyTarget;
                    brain = WaterBrain(
                      dailyTarget: goal,
                      currentWater: brain.currentWater,
                    );
                  });
                }
              },
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
              ),

              child: const Icon(FontAwesomeIcons.gear, color: Colors.black),
            ),
          ),

          // Add water
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: OutlinedButton(
                onPressed: () async {
                  final dynamic addedAmount = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddWater()),
                  );

                  if (addedAmount != null) {
                    setState(() {
                      brain.addWater(addedAmount);
                    });
                  }
                },
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(36),
                ),
                child: const Icon(FontAwesomeIcons.plus, color: Colors.black),
              ),
            ),
          ),

          //reset button
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  brain.resetWater();
                });
              },
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
              ),
              child: const Icon(
                FontAwesomeIcons.barsStaggered,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
