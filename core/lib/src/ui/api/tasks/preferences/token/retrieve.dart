import 'package:glow/glow_architecture.dart';

/// Состояние успешно выполненного [RetrieveUserTokenTask].
class TokenRetrievedState extends TaskDoneState {
  /// Полученый токен.
  final String token;

  /// Базовый конструктор.
  TokenRetrievedState(this.token);
}

/// Задача получения токена пользователя из хранилища настроек.
class RetrieveUserTokenTask extends Task {

  /// Запускает выполнение задачи.
  @override
  void run() async {
    emit(TaskInProgressState());

    String? token = await UserTokenRetriever().retrieveToken();
    if (token != null)
      emit(TokenRetrievedState(token));
    else
      emit(TaskErrorState());
  }
}

/// Интерфейс загрузчика токена пользователя.
abstract class UserTokenRetriever{

  /// Возвращает реализацию интерфейса.
  factory UserTokenRetriever() => throw UnimplementedError();

  Future<String?> retrieveToken();
}