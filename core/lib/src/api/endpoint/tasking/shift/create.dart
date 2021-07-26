import 'package:memento_core/src/api/data/camp/shift.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractCreateShiftTask extends Task {
  void create(Shift shift);
}
