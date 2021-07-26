import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractUpdateGroupTask extends Task {
  void update(Group group);
}
