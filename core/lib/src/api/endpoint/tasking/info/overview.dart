import 'package:memento_core/src/api/data/info/info.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class OverviewInfoSnapshot extends TaskResult<Info> {
  OverviewInfoSnapshot(Info snapshot) : super(snapshot);
}

abstract class AbstractOverviewInfoTask extends Task {
  void byUID(String uid);
}
