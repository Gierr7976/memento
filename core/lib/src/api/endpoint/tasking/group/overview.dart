import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class GroupOverviewSnapshot extends TaskResult<Group> {
  GroupOverviewSnapshot(Group snapshot) : super(snapshot);
}

abstract class AbstractOverviewGroupTask extends Task {
  void byUID(String uid);
}
