import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/data/human/user.dart';

/// Структурная группа. Используется для формирования служебной структуры лагеря.
class StructuralGroup extends Group {
  final List<Group> subGroups;

  StructuralGroup({
    required String uid,
    required String name,
    required User administrator,
    List<User> users = const [],
    this.subGroups = const [],
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
    List<Group>? subGroups,
  }) =>
      StructuralGroup(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        administrator: administrator ?? this.administrator,
        users: users ?? this.users,
        subGroups: subGroups ?? this.subGroups,
      );
}
