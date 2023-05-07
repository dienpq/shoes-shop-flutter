class NotificationModel {
  final int id;
  final String title;
  final String content;
  final String type;
  final String time;

  NotificationModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.type,
      required this.time});
}
