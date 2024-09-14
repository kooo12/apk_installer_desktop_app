import 'package:intl/intl.dart';

String timeAgo(String? dateTimeStr) {
  if (dateTimeStr == null || dateTimeStr.isEmpty || dateTimeStr == '') {
    return 'Offline';
  }
  DateTime dateTime = DateTime.parse(dateTimeStr);
  final DateTime localDateTime = dateTime.toLocal();

  Duration diff = DateTime.now().difference(localDateTime);

  if (diff.inDays > 1) {
    return DateFormat('dd MMM').format(localDateTime);
  } else if (diff.inDays == 1) {
    return 'Yesterday';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} seconds ago';
  } else {
    return 'Just Now';
  }
}
