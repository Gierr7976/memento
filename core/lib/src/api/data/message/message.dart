import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/prototype/prototype.dart';

abstract class Message extends Prototype {
  final User author;
  final DateTime created;
  final List<MessageData> editions;

  Message({
    required String uid,
    required this.author,
    required this.created,
    required this.editions,
  }) : super(
          uid: uid,
        );

  @override
  Message copyWith({
    String? uid,
    User? author,
    DateTime? created,
    List<MessageData>? editions,
  });
}

abstract class MessageData extends Prototype {
  final DateTime created;

  MessageData({
    required String uid,
    required this.created,
  }) : super(
          uid: uid,
        );

  @override
  MessageData copyWith({
    String? uid,
    DateTime? created,
  });
}
