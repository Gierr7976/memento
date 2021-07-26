import 'package:memento_core/src/api/data/camp/shift.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class ShiftOverviewSnapshot extends TaskResult<Shift> {
  ShiftOverviewSnapshot(Shift snapshot) : super(snapshot);
}

abstract class AbstractOverviewShiftTask extends Task {
  void byUID(String uid);

  void byDate(DateTime date);
}
