import 'package:memento_core/src/api/data/prototype/prototype.dart';

class Camp extends Prototype {
  final String name;

  Camp({
    required String uid,
    required this.name,
  }) : super(
          uid: uid,
        );

  @override
  Prototype copyWith({
    String? uid,
    String? name,
  }) =>
      Camp(
        uid: uid ?? this.uid,
        name: name ?? this.name,
      );
}
