import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractUpdateUserTask extends Task {
  void update(User user);
}
