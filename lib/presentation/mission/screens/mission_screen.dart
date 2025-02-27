import 'package:englifyar_teacher/presentation/mission/widgets/add_mission.dart';
import 'package:englifyar_teacher/presentation/mission/widgets/mission_list.dart';

import 'package:flutter/material.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GroupMission(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMissionScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
