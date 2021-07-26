import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class UserOverviewSnapshot extends TaskResult<User> {
  UserOverviewSnapshot(User snapshot) : super(snapshot);
}

abstract class AbstractOverviewUserTask extends Task {
  void byUID(String uid);
}
