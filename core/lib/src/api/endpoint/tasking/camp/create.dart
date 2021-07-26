import 'package:memento_core/src/api/data/camp/camp.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractCreateCampTask extends Task {
  void create(Camp camp);
}
