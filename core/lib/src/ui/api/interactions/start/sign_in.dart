import 'package:glow/glow_architecture.dart';
import 'package:memento_core/src/ui/api/tasks/start/sign_in.dart';

class SignedInEvent extends OkEvent {}

class SignInFailureEvent extends ErrorEvent {}

class ShowSignIn extends InteractionReadyState {}

class SignInInteraction extends Interaction {
  @override
  void load() async {
    BypassSignInTask bypassTask = BypassSignInTask()..run();
    TaskState bypassResult = await bypassTask.result;

    if (bypassResult is SignedIn)
      informer.raiseEvent(SignedInEvent());
    else
      emit(ShowSignIn());

    bypassTask.close();
  }

  void signIn() async {
    SignInTask task = SignInTask()..run();

    TaskState result = await task.result;

    if (result is SignedIn)
      informer.raiseEvent(SignedInEvent());
    else
      informer.raiseEvent(SignInFailureEvent());

    task.close();
  }
}
