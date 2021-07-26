import 'package:memento_core/src/api/data/info/info.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractCreateInfo extends Task {
  void create(Info info);
}
