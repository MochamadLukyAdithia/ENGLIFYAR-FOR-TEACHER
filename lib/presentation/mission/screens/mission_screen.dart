import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_bloc.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_state.dart';
import 'package:englifyar_teacher/presentation/mission/widgets/mission_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => MissionCubit(),
      child: BlocBuilder<MissionCubit, MissionState>(builder: (context, state) {
        if (state is MissionLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MissionLoaded) {
          return GroupMission();
        }
        if(state is MissionError){
          return Text(state.errorMessage);
        }
        return Container();
      }),
    ));
  }
}
