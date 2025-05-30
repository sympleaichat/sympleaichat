import 'message.dart';

class Thread {
  final String threadId;
  String title;
  List<Message> messages;
  bool isUnread;

  Thread({
    required this.threadId,
    this.title = '',
    this.messages = const [],
    this.isUnread = true,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'thread_id': threadId,
      'title': title,
      'messages': messages.map((m) => m.toJson()).toList(),
      'is_unread': isUnread,
    };
  }

  // Create an object from JSON
  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      threadId: json['thread_id'],
      title: json['title'],
      messages:
          (json['messages'] as List).map((m) => Message.fromJson(m)).toList(),
      isUnread: json['is_unread'] ?? true,
    );
  }
}
