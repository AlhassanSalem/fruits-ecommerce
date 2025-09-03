import 'package:hydrated_bloc/hydrated_bloc.dart';

class BottomNavigationBarCubit extends HydratedCubit<int> {
  BottomNavigationBarCubit() : super(0);

  /// Change the currently selected index
  void changeIndex(int index) {
    emit(index);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['index'] as int?;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'index': state};
  }
}
