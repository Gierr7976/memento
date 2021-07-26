import 'package:memento_core/src/api/data/group/group.dart';
import 'package:memento_core/src/api/data/human/user.dart';
import 'package:memento_core/src/api/data/info/info.dart';
import 'package:memento_core/src/api/data/info/info_message.dart';
import 'package:memento_core/src/api/data/message/message.dart';

class OrderedInfo extends Info {
  OrderedInfo({
    required String uid,
    required String title,
    required DateTime created,
    required User author,
    List<User> personalDestinations = const [],
    List<Group> groupDestinations = const [],
    required InfoMessage initialMessage,
    List<InfoMessage> additionalMessages = const [],
  }) : super(
          uid: uid,
          title: title,
          created: created,
          author: author,
          personalDestinations: personalDestinations,
          groupDestinations: groupDestinations,
          initialMessage: initialMessage,
          additionalMessages: additionalMessages,
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
  }) =>
      OrderedInfo(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        created: created ?? this.created,
        author: author ?? this.author,
        personalDestinations: personalDestinations ?? this.personalDestinations,
        groupDestinations: groupDestinations ?? this.groupDestinations,
        initialMessage: initialMessage ?? this.initialMessage,
        additionalMessages: additionalMessages ?? this.additionalMessages,
      );
}
