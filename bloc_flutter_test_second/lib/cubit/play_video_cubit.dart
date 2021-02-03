import 'package:flutter_bloc/flutter_bloc.dart';

class PlayVideoCubit extends Cubit<bool> {
  PlayVideoCubit() : super(true);

  void play() => emit(state == true);
  void stop() => emit(state == false);
}