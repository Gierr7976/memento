import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/info/info.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class ListInfoSnapshot extends TaskResult<List<Info>> {
  ListInfoSnapshot(List<Info> snapshot) : super(snapshot);
}

abstract class AbstractListInfoTask extends Task {
  void byUser(User user);
}
