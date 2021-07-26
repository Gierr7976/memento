import 'package:memento_core/src/api/data/camp/camp.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractUpdateCampTask extends Task {
  void update(Camp camp);
}
