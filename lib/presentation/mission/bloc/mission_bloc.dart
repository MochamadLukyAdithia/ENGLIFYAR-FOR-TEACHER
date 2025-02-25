import 'package:englifyar_teacher/domain/usecases/mission/mission_get.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/mission_state.dart';
import 'package:englifyar_teacher/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionCubit extends Cubit<MissionState> {
  MissionCubit() : super(MissionLoading());
  Future<void> addMission() async {
    var add = await sl<MissionUseCase>().call();
    add.fold((l) {
      emit(MissionError(errorMessage: l));
    }, (data) {
      emit(MissionLoaded(misi: data));
    });
  }
}
