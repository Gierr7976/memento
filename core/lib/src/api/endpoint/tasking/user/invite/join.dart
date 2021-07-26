import 'package:memento_core/src/api/data/camp/invite.dart';
import 'package:memento_core/src/api/endpoint/tasking/task.dart';

abstract class AbstractJoinInviteTask extends Task {
  void join(Invite invite);
}
