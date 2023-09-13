class Reuse{
 static String timeAgo(String timeString) {
  DateTime dateTime = DateTime.parse(timeString);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);
  if (difference.inMinutes < 1) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else {
    return '${difference.inDays ~/ 7} weeks ago';
  }
}
}