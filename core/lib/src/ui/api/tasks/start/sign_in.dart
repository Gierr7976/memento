import 'package:glow/glow_architecture.dart';
import 'package:memento_core/src/ui/api/interfaces/account/auth_manager.dart';

class SignedIn extends TaskDoneState {}

class SignInRequired extends TaskDoneState {}

class SignInFailure extends TaskErrorState {}

class BypassSignInTask extends Task {
  @override
  Future task() async {
    if (await AuthManager().alreadySignedIn())
      emit(SignedIn());
    else
      emit(SignInRequired());
  }
}

class SignInTask extends Task {
  @override
  Future task() async {
    if (await AuthManager().signIn())
      emit(SignedIn());
    else
      emit(SignInFailure());
  }
}
