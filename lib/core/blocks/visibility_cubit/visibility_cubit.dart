import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityCubit extends Cubit<bool> {
  VisibilityCubit() : super(false);

  void show() => emit(true);

  void hide() => emit(false);

  void change() => emit(!state);
}
