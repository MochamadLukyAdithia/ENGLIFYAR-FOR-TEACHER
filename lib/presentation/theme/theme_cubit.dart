import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json["indexTheme"]];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {"indexTheme": state.index};
  }
}
