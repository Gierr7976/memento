import 'package:glow/glow_architecture.dart';

class SaveUserTokenTask extends Task {
  final String token;

  SaveUserTokenTask(this.token);

  @override
  void run() async {
    emit(TaskInProgressState());

    if (await UserTokenSaver().save(token))
      emit(TaskDoneState());
    else
      emit(TaskErrorState());
  }
}

abstract class UserTokenSaver {
  factory UserTokenSaver() => throw UnimplementedError();

  Future<bool> save(String token);
}
