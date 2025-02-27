import 'package:englifyar_teacher/core/assets/images/app_image_network.dart';
import 'package:englifyar_teacher/core/themes/app_colors.dart';
import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_bloc.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupMission extends StatelessWidget {
  final isCategoryGroup = true;
  const GroupMission({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MissionCubit()..fetchMission(),
      child: BlocBuilder<MissionCubit, MissionState>(builder: (context, state) {
        if (state is MissionLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
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
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
              image: DecorationImage(
                image: isCategoryGroup
                    ? NetworkImage(
                        AppImagesNetwork.group,
                      )
                    : NetworkImage(
                        AppImagesNetwork.individual,
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: 1,
    );
  }
}
