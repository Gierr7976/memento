import 'package:memento_core/src/api/data/camp/camp.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractDeleteCampTask extends Task {
  void delete(Camp camp);
}
