import 'package:memento_core/src/api/data/camp/camp.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class CampOverviewSnapshot extends TaskResult<Camp> {
  CampOverviewSnapshot(Camp snapshot) : super(snapshot);
}

abstract class AbstractOverviewCampTask extends Task {
  void byUID(String uid);
}
