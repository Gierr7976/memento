import 'package:memento_core/src/api/endpoint/tasking/task.dart';

class InviteGeneratedState extends TaskResult {
  InviteGeneratedState(snapshot) : super(snapshot);
}

abstract class AbstractGenerateInviteTask extends Task {
  void generate();
}
