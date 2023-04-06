class EventComment {
  final int id;
  final String content;
  final String? userName;
  final String? invitedName;
  final String? invitedFirstName;
  final String? invitedEmail;


  const EventComment({
    required this.id,
    required this.content,
    required this.userName,
    required this.invitedName,
    required this.invitedFirstName,
    required this.invitedEmail,
  });

  factory EventComment.fromJson(Map<String, dynamic> json) {
    return EventComment(
      id: json['id'],
      content: json['content'],
      userName: json['user_name'],
      invitedName: json['invited_name'],
      invitedFirstName: json['invited_firstName'],
      invitedEmail: json['invited_mail'],
    );
  }
}
