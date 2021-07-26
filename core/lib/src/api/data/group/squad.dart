import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/data/human/user.dart';

///Отряд. Nuff said.
class Squad extends Group {
  Squad({
    required String uid,
    required String name,
    required User administrator,
    List<User> users = const [],
  }) : super(
          uid: uid,
          name: name,
          administrator: administrator,
          users: users,
        );

  @override
  Group copyWith({
    String? uid,
    String? name,
    User? administrator,
    List<User>? users,
  }) =>
      Squad(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        administrator: administrator ?? this.administrator,
        users: users ?? this.users,
      );
}
