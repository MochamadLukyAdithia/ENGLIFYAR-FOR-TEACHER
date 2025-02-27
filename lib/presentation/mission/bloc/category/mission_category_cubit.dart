import 'package:englifyar_teacher/domain/usecases/mission/get_all_usecase.dart';
import 'package:englifyar_teacher/presentation/mission/bloc/category/mission_category_state.dart';
import 'package:englifyar_teacher/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionCategoryCubit extends Cubit<MissionCategoryState> {
  MissionCategoryCubit() : super(MissionCategoryLoading());
  Future<void> fetchCategory() async {
    var category = await sl<GetAllMissionUseCase>().call();
    category.fold((l) {
      emit(MissionCategoryError(errorMessage: l));
    }, (r) {
      emit(MissionCategoryLoaded(misi: r));
    });
  }
}
