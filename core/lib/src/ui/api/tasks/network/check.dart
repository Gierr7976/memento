import 'package:glow/glow_architecture.dart';
import 'package:memento_core/src/ui/constants.dart';

/// Задача проверки доступности интернет-соединения путём подключения
/// к доверенному серверу, по умолчанию по адресу [DEFAULT_TRUSTED_URL].
abstract class NetworkCheckTask extends Task {

  /// Адрес доверенного сервера
  final String trustedURL;

  /// Базовый конструктор
  NetworkCheckTask({
    this.trustedURL = DEFAULT_TRUSTED_URL,
  });

  /// Запускает выполнение задачи.
  @override
  void run() async {
    emit(TaskInProgressState());

    if (await URLAvailabilityInspector().checkURL(trustedURL))
      emit(TaskDoneState());
    else
      emit(TaskErrorState());
  }
}

/// Интерфейс инспектора доступности URL-адреса.
abstract class URLAvailabilityInspector{

  /// Возвращает реализацию интерфейса.
  factory URLAvailabilityInspector() => throw UnimplementedError();

  /// Обращается к URL адресу и возвращает [true], если он доступен,
  /// или [false] в противном случае.
  Future<bool> checkURL(String url);
}