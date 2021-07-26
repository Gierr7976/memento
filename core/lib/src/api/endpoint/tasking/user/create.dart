import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractCreateUserTask extends Task {
  void create(User user);
}
