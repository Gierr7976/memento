import 'package:memento_core/src/api/data/camp/shift.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractDeleteShiftTask extends Task {
  void delete(Shift shift);
}
