import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/info/info_message.dart';
import 'package:memento_core/src/api/data/message/message.dart';
import 'package:memento_core/src/api/data/prototype/prototype.dart';

abstract class Info extends Prototype {
  final String title;
  final DateTime created;
  final User author;
  final List<User> personalDestinations;
  final List<Group> groupDestinations;
  final InfoMessage initialMessage;
  final List<InfoMessage> additionalMessages;

  Info({
    required String uid,
    required this.title,
    required this.created,
    required this.author,
    this.personalDestinations = const [],
    this.groupDestinations = const [],
    required this.initialMessage,
    this.additionalMessages = const [],
  }) : super(
          uid: uid,
        );

  @override
  Info copyWith({
    String? uid,
    String? title,
    DateTime? created,
    User? author,
    List<User>? personalDestinations,
    List<Group>? groupDestinations,
    InfoMessage? initialMessage,
    List<InfoMessage>? additionalMessages,
  });
}
