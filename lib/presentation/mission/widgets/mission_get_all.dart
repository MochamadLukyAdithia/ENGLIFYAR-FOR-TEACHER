import 'package:englifyar_teacher/core/assets/images/app_image_network.dart';

import 'package:englifyar_teacher/domain/entities/mission/mission_entity.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/category/mission_category_cubit.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/category/mission_category_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionGetAll extends StatefulWidget {
  const MissionGetAll({super.key});

  @override
  State<MissionGetAll> createState() => _MissionGetAllState();
}

class _MissionGetAllState extends State<MissionGetAll> {
  final bool isCategoryGroup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mission List")),
      body: BlocProvider(
        create: (_) => MissionCategoryCubit()..fetchCategory(),
        child: BlocBuilder<MissionCategoryCubit, MissionCategoryState>(
          builder: (context, state) {
            if (state is MissionCategoryLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MissionCategoryLoaded) {
              if (state.misi.isEmpty) {
                return Center(child: Text("No missions available"));
              }
              return _buildMission(state.misi);
            }
            if (state is MissionCategoryError) {
              return Center(child: Text(state.errorMessage));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildMission(List<MissionEntity> misi) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
              image: DecorationImage(
                image: isCategoryGroup
                    ? NetworkImage(AppImagesNetwork.group)
                    : NetworkImage(AppImagesNetwork.individual),
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
