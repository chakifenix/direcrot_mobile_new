import 'package:easy_localization/easy_localization.dart';

String formatDate(String dateString) {
  DateTime now = DateTime.now();
  if (dateString != '') {
    DateTime date = DateTime.parse(dateString);

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      // Если дата - это вчера
      return 'Вчера, в ${DateFormat('HH:mm').format(date)}';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      // Если дата - это сегодня
      return 'Сегодня, в ${DateFormat('HH:mm').format(date)}';
    } else {
      // Форматируем дату в формате 'dd.MM.yyyy, в HH:mm'
      return DateFormat('dd.MM.yyyy, в HH:mm').format(date);
    }
  }
  return '';
}
