import 'package:flutter/material.dart';

int dailytarget = 0;

class Getdailygoal extends StatefulWidget {
  const Getdailygoal({super.key});

  @override
  State<Getdailygoal> createState() => _GetdailygoalState();
}

class _GetdailygoalState extends State<Getdailygoal> {
  int dailyTarget = 500; // start value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Daily Target Between 500 - 5000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [




          Padding(

            padding: const EdgeInsets.all(16),
            child: Slider(value: dailyTarget.toDouble(),
              min: 500,
              max: 5000,
                onChanged: (double newValue){
              setState(() {
                dailyTarget = newValue.toInt();
              });
                }
            ),
          ),



          Text('Daily Goal $dailyTarget', style: TextStyle(fontSize: 24),),
          SizedBox(height: 80,),

          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),color:Color(0xFFc6e4e4),
            ),
            child: TextButton(onPressed: (){
              Navigator.pop(context, dailyTarget);
            }, child: Text('Save')),
          ),

        ],



      ),
         
    );
  }
}
