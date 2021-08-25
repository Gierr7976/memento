/// Интерфейс инспектора доступности URL-адреса.
abstract class URLAvailabilityInspector{

  /// Возвращает реализацию интерфейса.
  factory URLAvailabilityInspector() => throw UnimplementedError();

  /// Обращается к URL адресу и возвращает [true], если он доступен,
  /// или [false] в противном случае.
  Future<bool> checkURL(String url);
}