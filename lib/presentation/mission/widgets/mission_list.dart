import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_bloc.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupMission extends StatelessWidget {
  const GroupMission({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MissionCubit(),
      child: BlocBuilder<MissionCubit, MissionState>(builder: (context, state) {
        if (state is MissionLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ),
          );
        }
        if (state is MissionLoaded) {
          return _buildList(state.misi);
        }
        if (state is MissionError) {
          return Text("Error: ${state.errorMessage}");
        }
        return Container();
      }),
    );
  }

  Widget _buildList(List<MissionEntity> misi) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 30,
          );
        },
        itemCount: misi.length);
  }
}
