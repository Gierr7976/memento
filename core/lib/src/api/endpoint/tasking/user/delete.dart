import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractDeleteUserTask extends Task {
  void delete(User user);
}
